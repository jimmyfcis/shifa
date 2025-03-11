import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/reminders_body.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';

class CareReminderScreen extends StatelessWidget {
  const CareReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "Care Reminder"),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: RemindersBody(
        icon: themeProvider.currentTheme == ThemeEnum.leksell
            ? SVGAssets.careShifaIcon
            : SVGAssets.careShifaIcon,
        reminderType: ReminderType.care,
        noRecordTitle:
            "you didn’t add any Care reminder yet.\nStart to add your reminder",
        cardTitle: "Examination Reminder",
      ),
    );
  }
}
