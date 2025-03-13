import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
class PaymentValue extends StatelessWidget {
  final String title;
  final String value;

  const PaymentValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.nexaRegular.copyWith(
            color: AppTheme.primaryTextColor,
            fontSize: 16.sp,
          ),
        ),
        Text(
          value,
          style: TextStyles.nexaRegular.copyWith(
            color: AppTheme.primaryTextColor,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}