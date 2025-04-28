import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shifa/core/theme/theme.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgtes/auth_appbar.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';

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
    return AuthAppbar(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password",
                    style: TextStyles.nexaBold.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryTextColor,
                        fontSize: 24),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Please enter your registered mobile number to recover your password. we will send you a verification code to this number.",
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
                  SizedBox(height: 56.h),
                  CustomGreenButton(
                    title: "Send Verification Code",
                    onPressed: () {
                      if (phoneController.text.isEmpty) {
                        setState(() {
                          isValid = false;
                        });
                      } else if (isValid && phoneController.text.isNotEmpty) {
                        Navigator.pushNamed(context, AppRoutes.verifyOTP);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
