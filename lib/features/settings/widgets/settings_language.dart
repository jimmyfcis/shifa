import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/language_button.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Please, Select your preferred language',
            style: TextStyles.nexaBold.copyWith(
              fontSize: 16.sp,
              color: AppTheme.darkGreyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          LanguageButton(
            language: "English",
            onTap: () {},
          ),
          const SizedBox(height: 16),
          LanguageButton(
            language: "العربية",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
