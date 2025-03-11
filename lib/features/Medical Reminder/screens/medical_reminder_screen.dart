import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/reminders_body.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';

class MedicalReminderScreen extends StatelessWidget {
  const MedicalReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "Medical Reminder"),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: RemindersBody(
        icon: themeProvider.currentTheme == ThemeEnum.leksell
            ? SVGAssets.medicineLeksellIcon
            : SVGAssets.medicineShifaIcon,
        noRecordTitle:
            "you didn’t add any medical reminder yet.\nStart to add your reminder",
        cardTitle: "Medical Reminder",
        reminderType: ReminderType.medical,
      ),
    );
  }
}
