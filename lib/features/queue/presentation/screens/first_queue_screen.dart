import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/form_fields/custom_drop_down_field.dart';
import '../../../../core/widgtes/watermark_widget.dart';

class FirstQueueScreen extends StatefulWidget {
  const FirstQueueScreen({super.key});

  @override
  State<FirstQueueScreen> createState() => _FirstQueueScreenState();
}

class _FirstQueueScreenState extends State<FirstQueueScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
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
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:24.w),
                  child: Text(
                    "Select doctor to monitor the queue",
                    style: TextStyles.nexaRegular.copyWith(
                      color: AppTheme.grey5Color,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          CustomDropdownField(
                            name: 'doctor',
                            isRequired: true,
                            labelText: 'Select Doctor',
                            items: ["Waleed Yousry", "Ahmed Mahmoud", "Mohamed Ahmed"],
                            itemBuilder: (context, data) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: AppTheme.whiteColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data,
                                        style: TextStyles.nexaRegular.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: AppTheme.whiteColor,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: const ContinuousRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                    child: CustomGreenButton(
                      title: "View Queue",
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.secondQueueScreen);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
