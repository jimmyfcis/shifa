import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';

import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';

class CancelYourVisitDialogue extends StatelessWidget {
  const CancelYourVisitDialogue({
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Cancel Your Visit!",
              style: TextStyles.nexaBold.copyWith(
                color: AppTheme.primaryTextColor,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Are you sure you want to cancel your doctor visit?",
              textAlign: TextAlign.center,
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.secondaryTextColor,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomWhiteButton(
                    title: "No",
                    borderColor: AppTheme.secondaryTextColor,
                    textColor: AppTheme.secondaryTextColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: CustomGreenButton(
                    title: "Yes, Cancel",
                    fontSize: 14,
                    backGroundColor: AppTheme.redColor,
                    borderColor: AppTheme.redColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
