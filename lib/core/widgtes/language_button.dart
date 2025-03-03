import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';

import '../routes/app_routes.dart';

class LanguageButton extends StatefulWidget {
  final String language;

  const LanguageButton({super.key, required this.language});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),

              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.whiteColor),
              shadowColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
              overlayColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: AppTheme.greyColor)))),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.language,
              style: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          )),
    );
  }
}
