import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/theme.dart';

class CustomIconContainer extends StatelessWidget {
  final String icon;
  final String? label;

  const CustomIconContainer({
    Key? key,
    required this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: label != null ? 137.w : null,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppTheme.greyColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 20.w,
            height: 20.h,
          ),
          if (label != null) ...[
            SizedBox(
              width: 8.w,
            ),
            Text(
              label!,
              style: TextStyle(
                color: AppTheme.darkGreyColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
