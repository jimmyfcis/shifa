import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/localization/locale_provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/language_button.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isEnglish = localeProvider.locale.languageCode == 'en';
    final isArabic = localeProvider.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            context.tr.translate('select_language'),
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
            language: context.tr.translate('english'),
            onTap: () {
              localeProvider.setEnglish();
            },
            isSelected: isEnglish,
          ),
          const SizedBox(height: 16),
          LanguageButton(
            language: context.tr.translate('arabic'),
            onTap: () {
              localeProvider.setArabic();
            },
            isSelected: isArabic,
          ),
        ],
      ),
    );
  }
}
