import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';

class ProfileWidget extends StatelessWidget {
  final bool hasDivider;
  final String svgIcon;
  final String title;
  final VoidCallback onTap;

  const ProfileWidget({
    super.key,
    required this.hasDivider,
    required this.onTap,
    required this.svgIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    svgIcon,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              isArabic
                  ? Image.asset(
                      Assets.arrowLeft,
                      width: 24.w,
                      height: 24.h,
                    )
                  : SvgPicture.asset(
                      SVGAssets.arrowRight,
                    ),
            ],
          ),
        ),
        if (hasDivider) ...[
          SizedBox(
            height: 16.h,
          ),
          Divider(
            color: AppTheme.greyColor,
            height: 1.h,
          ),
        ]
      ],
    );
  }
}
