import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

import '../../../core/widgtes/custom_green_button.dart';

class SurgicalInterventionItem extends StatelessWidget {
  const SurgicalInterventionItem({
    super.key,
    required this.themeProvider,
    required this.title,
    this.date,
    this.doctor,
    this.day,
    this.file,
  });

  final ThemeProvider themeProvider;
  final String? title;
  final String? doctor;
  final String? day;
  final String? date;
  final String? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppTheme.greyColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null && title!.isNotEmpty)
              Row(
                children: [
                  SvgPicture.asset(
                    themeProvider.currentTheme == ThemeEnum.leksell
                        ? SVGAssets.clincsLeksellIcon
                        : SVGAssets.clincsShifaIcon,
                    width: 22.w,
                    height: 22.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Text(
                      title ?? "",
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 14.sp,
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 16.h,
            ),
            if (doctor != null && doctor!.isNotEmpty)
              Row(
                children: [
                  SvgPicture.asset(
                    themeProvider.currentTheme == ThemeEnum.leksell
                        ? SVGAssets.clincsLeksellIcon
                        : SVGAssets.clincsShifaIcon,
                    width: 22.w,
                    height: 22.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Text(
                      doctor ?? "",
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 14.sp,
                        color: AppTheme.primaryTextColor,
                      ),
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
                  SVGAssets.bookingIcon,
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                if (date != null && date!.isNotEmpty)
                  Text(
                    date ?? "",
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
                  SVGAssets.bookingIcon,
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                if (day != null && day!.isNotEmpty)
                  Text(
                    day ?? "",
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
            file == null || file!.isEmpty
                ? const SizedBox.shrink(): CustomGreenButton(
              title: context.tr.translate('view_file'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.recordsDetails,
                  arguments: {
                    "file": file ?? "",
                    "isLab": false,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
