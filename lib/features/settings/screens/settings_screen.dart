import 'package:flutter/material.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/settings/widgets/settings_language.dart';
import 'package:provider/provider.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: SettingsLanguage(),
      appBarChild: CommonAppBarTitle(
        title: context.tr.translate('settings'),
      ),
      height: 105,
      alignment: Alignment.bottomCenter,
    );
  }
}
