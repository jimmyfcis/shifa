import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class HomeServiceCard extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const HomeServiceCard({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: themeProvider.currentTheme == ThemeEnum.shifa ? 70.w : 99.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              width: themeProvider.currentTheme == ThemeEnum.shifa ? null : 1.sw,
              height: themeProvider.currentTheme == ThemeEnum.shifa ? null : 98.h,
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.blackColor.withOpacity(0.1),
                    offset: Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                icon,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.nexaRegular
                  .copyWith(fontSize: 12.sp, color: AppTheme.primaryTextColor),
            )
          ],
        ),
      ),
    );
  }
}
