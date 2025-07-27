import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/data/models/records_response_model.dart';

class RecordsItem extends StatelessWidget {
  final LabRecord? labRecord;
  final RadRecord? radRecord;
  final String icon;

  const RecordsItem({
    super.key,
     this.labRecord,
     this.radRecord,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  isArabic?labRecord?.testNameAr??radRecord?.serviceNameAr??"":labRecord?.testNameEn??radRecord?.serviceNameEn??"",
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
            Text(
              isArabic?"${context.tr.translate("category")}: ${labRecord?.categoryAr??radRecord?.categoryAr??""}":"Category: ${labRecord?.categoryEn??radRecord?.categoryEn??""}",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 14.sp,
                color: AppTheme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 1,
              color: AppTheme.greyColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "${context.tr.translate("date")}: ${labRecord?.date??radRecord?.date??""}",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 14.sp,
                color: AppTheme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 1,
              color: AppTheme.greyColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              isArabic?"${context.tr.translate("status")}: ${labRecord?.serviceStatusAr??radRecord?.serviceStatusAr??""}":"Status: ${labRecord?.serviceStatusEn??radRecord?.serviceStatusEn??""}",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 14.sp,
                color: AppTheme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
