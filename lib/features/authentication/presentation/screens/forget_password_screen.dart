import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/authentication/presentation/cubit/forget%20password/forget_password_cubit.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgtes/auth_appbar.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../../../core/localization/app_extensions.dart';
import '../cubit/forget password/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return AuthAppbar(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordFailure) {
                showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
              } else if (state is ForgetPasswordSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
                showCustomSnackBar(context, state.forgetPasswordResponse.message ?? "", isError: false);
              }
            },
            builder: (context, state) {
              final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
              return state is ForgetPasswordLoading
                  ? Center(child: Padding(
                    padding:  const EdgeInsets.only(top: 100.0),
                    child: CircularProgressIndicator(color: themeProvider.currentThemeData!.primaryColor,),
                  ))
                  : Column(
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.translate('forget_password_title'),
                          style: TextStyles.nexaBold
                              .copyWith(fontWeight: FontWeight.bold, color: AppTheme.primaryTextColor, fontSize: 24),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          context.tr.translate('forget_password_message'),
                          softWrap: true,
                          style: TextStyles.nexaRegular
                              .copyWith(fontWeight: FontWeight.w400, color: AppTheme.grey5Color, fontSize: 12),
                        ),
                        SizedBox(height: 32.h),
                        PhoneNumberField(
                          controller: phoneController,
                          isValid: isValid,
                          onInputChanged: (PhoneNumber number) {
                            setState(() {
                              isValid = Validators().isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                            });
                            return;
                          },
                        ),
                        SizedBox(height: 56.h),
                        CustomGreenButton(
                          title: context.tr.translate('send_verification_code'),
                          onPressed: () {
                            if (phoneController.text.isEmpty) {
                              setState(() {
                                isValid = false;
                              });
                            } else if (isValid && phoneController.text.isNotEmpty) {
                              forgetPasswordCubit.forgetPassword(
                                phoneController.text.trim().replaceAll(
                                      " ",
                                      "",
                                    ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
