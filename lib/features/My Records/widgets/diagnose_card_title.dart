import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/styles.dart';

import '../../../core/theme/theme.dart';

class DiagnoseCardTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool? hasDivider;

  const DiagnoseCardTitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.hasDivider = false,
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
          height: 16.h,
        ),
        Text(
          subTitle,
          style: TextStyles.nexaRegular.copyWith(
            fontSize: 16.sp,
            color: AppTheme.secondaryTextColor,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        if (hasDivider ?? false)
          Container(
            height: 1,
            color: AppTheme.greyColor,
          ),
      ],
    );
  }
}
