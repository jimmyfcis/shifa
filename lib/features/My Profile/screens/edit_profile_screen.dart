import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/custom_white_button.dart';
import '../../../core/widgtes/form_fields/custom_date_field.dart';
import '../../../core/widgtes/form_fields/custom_drop_down_field.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({super.key});

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      height: 105,
      alignment: Alignment.bottomCenter,
      appBarChild: CommonAppBarTitle(
        title: "Edit Profile",
      ),
      contentChild: Expanded(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.greyColor,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  ImageAssets.myProfileImg,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextField(
                        labelText: 'Your Name',
                        name: 'name',
                        isRequired: true,
                        hintText: 'Enter your name',
                      ),
                      SizedBox(height: 24.h),
                      CustomDropdownField(
                        name: 'blood_type',
                        isRequired: true,
                        labelText: 'Blood Type',
                        items: ["O+", "AB+", "AB-", "A-", "B-"],
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
                      SizedBox(height: 24.h),
                      CustomDateField(
                        name: 'date',
                        labelText: 'Date of birth',
                      ),
                      SizedBox(height: 24.h),
                      PhoneNumberField(
                        controller: phoneController,
                        isValid: isValid,
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                          setState(() {
                            isValid = Validators().isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                          });
                          return;
                        },
                      ),
                      SizedBox(height: 24.h),
                      CustomDropdownField(
                        name: 'martial',
                        isRequired: true,
                        labelText: 'Martial Status',
                        items: ["Married", "Single"],
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
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Your Email',
                        name: 'email',
                        isRequired: true,
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: AppTheme.whiteColor,
              margin: EdgeInsets.zero,
              shape: ContinuousRectangleBorder(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomWhiteButton(
                        title: "Cancel",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.rateYourVisit);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CustomGreenButton(
                        title: "Save Changes",
                        fontSize: 14,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
