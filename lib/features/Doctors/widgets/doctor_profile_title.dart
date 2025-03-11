import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
class DoctorProfileTitle extends StatelessWidget {
  final String title;
  const DoctorProfileTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:  TextStyles.nexaBold.copyWith(
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
        fontSize: 18.sp,
      ),
    );
  }
}
