import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
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
              title: "My Records",
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.clincsLeksellIcon
                  : SVGAssets.clincsShifaIcon,
            ),
            SizedBox(
              height: 16.h,
            ),
            MyCareCard(
              title: "Medication Reminder",
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.medicineLeksellIcon
                  : SVGAssets.medicineShifaIcon,
            ),
            SizedBox(
              height: 16.h,
            ),
            MyCareCard(
              title: "Vaccine Reminder",
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.vaccineLeksellIcon
                  : SVGAssets.vaccineShifaIcon,
            ),
            SizedBox(
              height: 16.h,
            ),
            MyCareCard(
              title: "Care Reminder",
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.careLeksellIcon
                  : SVGAssets.careShifaIcon,
            ),
            SizedBox(
              height: 16.h,
            ),
            MyCareCard(
              title: "Lab Tests",
              svgIcon: themeProvider.currentTheme == ThemeEnum.leksell
                  ? SVGAssets.labsLeksellIcon
                  : SVGAssets.labShifaIcon,
            ),
            SizedBox(
              height: 16.h,
            ),
            const MyCareCard(
                title: "Radiology", svgIcon: SVGAssets.radiologyIcon),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
