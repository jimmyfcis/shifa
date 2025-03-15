import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class MedicineRecordCard extends StatelessWidget {
  const MedicineRecordCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              themeProvider.currentTheme == ThemeEnum.shifa
                  ? SVGAssets.medicineShifaIcon
                  : SVGAssets.medicineLeksellIcon,
              width: 22.w,
              height: 22.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Medicines",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 14.sp,
                color: AppTheme.primaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Medicine Name",
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 14.sp,
                color: AppTheme.secondaryTextColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                log("Add To Reminder");
                Navigator.pushNamed(
                    context, AppRoutes.newMedicineReminderScreen);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: themeProvider.currentThemeData!.primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Add To Reminder",
                    style: TextStyles.nexaRegular.copyWith(
                      fontSize: 14.sp,
                      color: themeProvider.currentThemeData!.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              SVGAssets.pill,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "1 tab/Day",
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 14.sp,
                color: AppTheme.secondaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              SVGAssets.clock,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "2 Weeks",
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 14.sp,
                color: AppTheme.secondaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
