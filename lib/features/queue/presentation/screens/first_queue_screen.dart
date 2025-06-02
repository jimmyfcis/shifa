import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:shifa/features/queue/presentation/cubit/queue_state.dart';

import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../../../core/widgtes/watermark_widget.dart';

class FirstQueueScreen extends StatefulWidget {
  const FirstQueueScreen({super.key});

  @override
  State<FirstQueueScreen> createState() => _FirstQueueScreenState();
}

class _FirstQueueScreenState extends State<FirstQueueScreen> {
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "Queue"),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: Expanded(
          child: BlocProvider(
            create: (context) => sl<QueueCubit>(),
            child: BlocConsumer<QueueCubit, QueueState>(
              listener: (context, state) {
                if (state is QueueError) {
                  showCustomSnackBar(context, state.message, isError: true,statusCode: state.statusCode);
                } else if (state is QueueLoaded) {
                  Navigator.pushNamed(context, AppRoutes.secondQueueScreen,arguments: {
                    "tickets": state.response.tickets??[],
                  });
                }
              },
              builder: (context, state) {
                final queueCubit = context.read<QueueCubit>();
                return state is QueueLoading?const Center(child: CircularProgressIndicator()):Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 34.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "Enter your phone number to see appointments",
                        style: TextStyles.nexaRegular.copyWith(
                          color: AppTheme.grey5Color,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          PhoneNumberField(
                            controller: phoneController,
                            isValid: isValid,
                            labelText: context.tr.translate('phone_number'),
                            onInputChanged: (PhoneNumber number) {
                              setState(() {
                                isValid = Validators()
                                    .isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Card(
                      color: AppTheme.whiteColor,
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: const ContinuousRectangleBorder(),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 10.h, bottom: 32.h),
                        child: CustomGreenButton(
                          title: "View Queue",
                          onPressed: () {
                            if (phoneController.text.isEmpty) {
                              setState(() {
                                isValid = false;
                              });
                            }
                            else if (isValid && phoneController.text.isNotEmpty) {
                              queueCubit.getTickets(
                                phoneController.text.trim().replaceAll(" ", ""),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}
