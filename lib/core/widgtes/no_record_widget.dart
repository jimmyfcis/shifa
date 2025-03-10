import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class NorRecordWidget extends StatelessWidget {
  final String icon;

  const NorRecordWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 77.w,
            height: 77.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'you didn’t have any records yet.',
            style: TextStyles.nexaRegular.copyWith(
              fontSize: 14.sp,
              color: AppTheme.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
