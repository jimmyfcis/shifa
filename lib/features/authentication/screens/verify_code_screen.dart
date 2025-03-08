import 'dart:async';  // Import for Timer
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgtes/auth_appbar.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/form_fields/otp_text_field.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController controller = TextEditingController();
  Timer? _timer;
  int _start = 30;  // Countdown start time in seconds
  bool _isResendEnabled = true;  // Control the button enabled/disabled state

  // Start the countdown timer
// Start the countdown timer
  void _startTimer() {
    setState(() {
      _isResendEnabled = false; // Disable the resend button
      _start = 30; // Reset the countdown timer to 30 seconds immediately
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendEnabled = true; // Enable the resend button
          _start = 30; // Reset countdown to 30 when it ends
        });
        _timer?.cancel(); // Stop the timer
      } else {
        setState(() {
          _start--; // Decrement the timer every second
        });
      }
    });
  }


  @override
  void dispose() {
    _timer?.cancel();  // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return AuthAppbar(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 64.0.h),
          child: Column(
            children: [
               SizedBox(height: 42.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Verification Code",
                      style: TextStyles.nexaRegular.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.blackColor,
                          fontSize: 24),
                    ),
                     SizedBox(height: 8.h),
                     Text(
                      "Signup now and start exploring all what our app has to offer. we are excited to welcome you to our community.",
                      softWrap: true,
                      style: TextStyles.nexaRegular.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppTheme.grey5Color,
                          fontSize: 12),
                    ),
                     SizedBox(height: 32.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const OTPTextField(
                            name: 'otp',
                          ),
                          Text(
                            '00:$_start',  // Show the countdown timer
                            style:  TextStyles.nexaRegular.copyWith(
                              color: themeProvider.currentThemeData!.primaryColor,
                              fontSize: 14,
                              decorationColor: themeProvider.currentThemeData!.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                           SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                'Don’t receive code?',
                                style: TextStyles.nexaRegular.copyWith(
                                  color: AppTheme.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: _isResendEnabled ? _startTimer : null,  // Only allow clicking if the button is enabled
                                child: Text(
                                  'Resend',
                                  style: TextStyles.nexaRegular.copyWith(
                                    color: _isResendEnabled ? themeProvider.currentThemeData!.primaryColor : AppTheme.greyColor,  // Change color when disabled
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                    decorationColor: _isResendEnabled ? themeProvider.currentThemeData!.primaryColor : AppTheme.greyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                           SizedBox(height: 34.h),
                          CustomGreenButton(
                            title: "Confirm",
                            onPressed: () {
                              var formState = _formKey.currentState;
                              if (formState == null) return;
                              if (!formState.saveAndValidate()) {
                                return;
                              }
                            },
                          ),
                           SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
