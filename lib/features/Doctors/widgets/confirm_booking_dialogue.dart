import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/localization/app_extensions.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
class ConfirmBookingDialogue extends StatelessWidget {
  const ConfirmBookingDialogue({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: themeProvider.currentTheme == ThemeEnum.shifa
                    ? AppTheme.billColor
                    : AppTheme.leksellSecondaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(23.0),
                child: SvgPicture.asset(SVGAssets.success),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Booking Success",
              style: TextStyles.nexaBold.copyWith(
                color: AppTheme.primaryTextColor,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Your Appointment has been booked successful.",
              textAlign: TextAlign.center,
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.secondaryTextColor,
                fontSize: 16.sp,
              ),
            ),
            Text(
              "your booking number is:",
              textAlign: TextAlign.center,
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.secondaryTextColor,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                color: themeProvider.currentThemeData!.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "17",
                  textAlign: TextAlign.center,
                  style: TextStyles.nexaRegular.copyWith(
                    color: AppTheme.whiteColor,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                context.tr.translate("my_appointments"),
                style: TextStyles.nexaRegular
                    .copyWith(
                  color: themeProvider.currentThemeData!.primaryColor,
                  fontSize: 16.sp,
                )
                    .copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: themeProvider.currentThemeData!.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}