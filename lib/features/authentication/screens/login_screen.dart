import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/auth_appbar.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/form_fields/password_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    //fetchAndUseRegisterData();
    super.initState();
  }

  // Future<void> fetchAndUseRegisterData() async {
  //   //RegisterModel? registerModel = await DiskRepo().getRegisterData();
  //   if (registerModel != null) {
  //     print("Name: ${registerModel.name}");
  //     print("Email: ${registerModel.email}");
  //     // Use this data as needed.
  //   } else {
  //     print("No data found in SharedPreferences.");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return AuthAppbar(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
                themeProvider.currentTheme == ThemeEnum.shifa ? SVGAssets.shifaIconText : SVGAssets.leksellAuth),
            SizedBox(height: 42.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyles.nexaRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        //fontFamily: FontsAssets.Nexa,
                        color: themeProvider.currentThemeData!.primaryColor,
                        fontSize: 24),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Please login to your account to access your account details .",
                    softWrap: true,
                    style: TextStyles.nexaRegular.copyWith(
                        fontWeight: FontWeight.w400,
                        // fontFamily: FontsAssets.Nexa,
                        color: AppTheme.grey5Color,
                        fontSize: 12),
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
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 24.h),
                        PasswordTextField(
                          labelText: 'Password',
                          name: 'password',
                          controller: controller,
                          isRequired: true,
                          hintText: 'Enter your password',
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.home);
                              },
                              child: Text('Forgot Password?',
                                  style: TextStyles.nexaRegular.copyWith(
                                      color: themeProvider.currentThemeData!.primaryColor,
                                      fontSize: 12,
                                      //fontFamily: FontsAssets.Nexa,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        SizedBox(height: 34.h),
                        CustomGreenButton(
                          title: "Login",
                          onPressed: () {
                            var formState = _formKey.currentState;
                            if (formState == null) return;
                            if (!formState.saveAndValidate()) {
                              return;
                            }
                            if (phoneController.text.isEmpty) {
                              setState(() {
                                isValid = false;
                              });
                            } else if (isValid && phoneController.text.isNotEmpty) {
                              Navigator.pushReplacementNamed(context, AppRoutes.home);
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text(
                                'or sign up with',
                                style: TextStyles.nexaRegular.copyWith(
                                  color: AppTheme.blackColor,
                                  fontSize: 12,
                                  //fontFamily: FontsAssets.Nexa,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SVGAssets.google),
                            SizedBox(width: 24.w),
                            SvgPicture.asset(SVGAssets.facebook),
                            SizedBox(width: 24.w),
                            SvgPicture.asset(SVGAssets.apple),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: TextStyles.nexaRegular.copyWith(
                                color: AppTheme.primaryTextColor,
                                fontSize: 12,
                                // fontFamily: FontsAssets.Nexa,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, AppRoutes.home);
                              },
                              child: Text(
                                ' Create account',
                                style: TextStyles.nexaRegular.copyWith(
                                  color: themeProvider.currentThemeData!.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42.h),
          ],
        ),
      ),
    );
  }

  // void getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'EG');
  //
  //   setState(() {
  //     this.number = number;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }
}
