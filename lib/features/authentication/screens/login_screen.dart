import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/disk_repo.dart';
import 'package:shifa/core/widgets/auth_appbar.dart';
import 'package:shifa/core/widgets/custom_green_button.dart';
import '../../../../core/assets/svg/svg_assests.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/fonts/fonts_manager.dart';
import '../../../core/utils/theme_notifier.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/form_fields/custom_password_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../core/widgets/form_fields/phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../models/register_model.dart';

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
    fetchAndUseRegisterData();
    super.initState();
  }
  Future<void> fetchAndUseRegisterData() async {
    RegisterModel? registerModel = await DiskRepo().getRegisterData();
    if (registerModel != null) {
      print("Name: ${registerModel.name}");
      print("Email: ${registerModel.email}");
      // Use this data as needed.
    } else {
      print("No data found in SharedPreferences.");
    }
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return AuthAppbar(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(themeProvider.currentTheme==ThemeEnum.Shifa?SVGAssets.shifaIconText:SVGAssets.leksellAuth),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontsAssets.Nexa,
                        color: AppTheme.blackColor,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please login to your account to access your account details .",
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontsAssets.Nexa,
                        color: AppTheme.grey5Color,
                        fontSize: 12),
                  ),
                  const SizedBox(height: 32),
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
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 24),
                        PasswordTextField(
                          labelText: 'Password',
                          name: 'password',
                          controller: controller,
                          hintText: 'Enter your password',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.forgetPassword);
                              },
                              child: Text('Forgot Password?',
                                  style: TextStyle(
                                      color: themeProvider.currentThemeData!.primaryColor,
                                      fontSize: 12,
                                      fontFamily: FontsAssets.Nexa,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 34),
                        CustomGreenButton(
                          title: "Login",
                          onPressed: () {
                            var formState = _formKey.currentState;
                            if (formState == null) return;
                            if (!formState.saveAndValidate()) {
                              return;
                            }
                            if (isValid && phoneController.text.isNotEmpty) {
                              Navigator.pushReplacementNamed(context, AppRoutes.home);
                            } else {
                              setState(() {
                                isValid = false;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text(
                                'or sign up with',
                                style: TextStyle(
                                  color: AppTheme.blackColor,
                                  fontSize: 12,
                                  fontFamily: FontsAssets.Nexa,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SVGAssets.google),
                            const SizedBox(width: 24),
                            SvgPicture.asset(SVGAssets.facebook),
                            const SizedBox(width: 24),
                            SvgPicture.asset(SVGAssets.apple),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                color: AppTheme.primaryText,
                                fontSize: 12,
                                fontFamily: FontsAssets.Nexa,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, AppRoutes.register);
                              },
                              child: Text(
                                ' Create account',
                                style: TextStyle(
                                  color: themeProvider.currentThemeData!.primaryColor,
                                  fontSize: 12,
                                  fontFamily: FontsAssets.Nexa,
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
            const SizedBox(height: 42),
          ],
        ),
      ),
      showSkip: true,
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