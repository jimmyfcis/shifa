import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class MyCareCard extends StatelessWidget {
  final String title;
  final String svgIcon;

  const MyCareCard({super.key, required this.title, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppTheme.blackColor.withOpacity(0.1),
            offset: const Offset(
              0,
              0,
            ),
            blurRadius: 24,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIcon,
            width: 36.w,
            height: 36.h,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            title,
            style: TextStyles.nexaBold.copyWith(
              fontSize: 16.sp,
              color: AppTheme.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
