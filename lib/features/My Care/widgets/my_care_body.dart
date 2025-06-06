import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Care/widgets/my_care_card.dart';

class MyCareBody extends StatelessWidget {
  const MyCareBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCareCard(
              title:  context.tr.translate("my_records"),
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.clincsLeksellIcon
                  : SVGAssets.clincsShifaIcon,
              onTap: () {
                log("My Records");
                Navigator.pushNamed(context, AppRoutes.myVisits);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            // MyCareCard(
            //   title:  context.tr.translate("medication_reminder"),
            //   svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
            //       ? SVGAssets.medicineLeksellIcon
            //       : SVGAssets.medicineShifaIcon,
            //   onTap: () {
            //     log("Medication Reminder");
            //     Navigator.pushNamed(context, AppRoutes.medicalReminder);
            //   },
            // ),
            // SizedBox(
            //   height: 16.h,
            // ),
            // MyCareCard(
            //   title:  context.tr.translate("vaccine_reminder"),
            //   svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
            //       ? SVGAssets.vaccineLeksellIcon
            //       : SVGAssets.vaccineShifaIcon,
            //   onTap: () {
            //     log("Vaccine Reminder");
            //     Navigator.pushNamed(context, AppRoutes.vaccineReminder);
            //   },
            // ),
            // SizedBox(
            //   height: 16.h,
            // ),
            // MyCareCard(
            //   title:  context.tr.translate("care_reminder"),
            //   svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
            //       ? SVGAssets.careLeksellIcon
            //       : SVGAssets.careShifaIcon,
            //   onTap: () {
            //     log("Care Reminder");
            //     Navigator.pushNamed(context, AppRoutes.careReminder);
            //   },
            // ),
            // SizedBox(
            //   height: 16.h,
            // ),
            MyCareCard(
              title:  context.tr.translate("lab_tests"),
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.labsLeksellIcon
                  : SVGAssets.labShifaIcon,
              onTap: () {
                log("Lab Tests");
                Navigator.pushNamed(context, AppRoutes.labTests);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            MyCareCard(
              title:  context.tr.translate("radiology"),
              svgIcon: SVGAssets.radiologyIcon,
              onTap: () {
                log("Radiology");
                Navigator.pushNamed(context, AppRoutes.radiology);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
