import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class LabTestsRadiologyRecordsCard extends StatelessWidget {
  final String title;
  final String icon;

  const LabTestsRadiologyRecordsCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
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
                title,
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
            "$title Name",
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
            "$title Name",
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
    );
  }
}
