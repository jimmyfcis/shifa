import 'package:flutter/material.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:provider/provider.dart';
class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105,
      appBarChild:  CommonAppBarTitle(
        title: context.tr.translate('terms_conditions'),
      ),
      contentChild: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Text(
              AppConstants.lognText,
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.secondaryTextColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
