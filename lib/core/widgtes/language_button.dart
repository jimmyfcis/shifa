import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppTheme.whiteColor),
              shadowColor:
                  MaterialStateProperty.all<Color>(AppTheme.green4Color),
              overlayColor:
                  MaterialStateProperty.all<Color>(AppTheme.green4Color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: AppTheme.greyColor)))),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              language,
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
