import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class MyProfileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool hasDivider;
  const MyProfileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.hasDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.nexaBold.copyWith(
            fontSize: 16.sp,
            color: AppTheme.primaryTextColor,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subTitle,
          style: TextStyles.nexaRegular.copyWith(
            fontSize: 16.sp,
            color: AppTheme.secondaryTextColor,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        if (hasDivider)
          const Divider(
            color: AppTheme.greyColor,
            thickness: 1,
          ),
      ],
    );
  }
}
