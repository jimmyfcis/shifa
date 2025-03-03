import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class ContactUsItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const ContactUsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 14.sp,
                color: AppTheme.primaryTextColor,
              ),
            ),
            Text(
              subtitle,
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 14.sp,
                color: AppTheme.darkGreyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
