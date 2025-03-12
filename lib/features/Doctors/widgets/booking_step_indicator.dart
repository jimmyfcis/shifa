import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';


class BookingStepIndicator extends StatelessWidget {
  final String step;
  final String title;
  final int index;
  final ThemeProvider themeProvider;
  const BookingStepIndicator({super.key, required this.step, required this.title, required this.themeProvider, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: TextStyles.nexaLight.copyWith(
              color: AppTheme.grey3color,
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
            ),
          ),
          Text(
            title,
            style: TextStyles.nexaRegular.copyWith(
              color: AppTheme.primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          Container(
            height: 5.h,
            decoration: BoxDecoration(
              color: index==0 ? themeProvider.currentThemeData!.primaryColor : AppTheme.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
