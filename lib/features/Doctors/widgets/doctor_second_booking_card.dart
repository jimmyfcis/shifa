import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
class DoctorSecondBookingCard extends StatelessWidget {
  const DoctorSecondBookingCard({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.currentTheme == ThemeEnum.shifa
            ? AppTheme.billColor
            : AppTheme.secondaryColorLeksell,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Doctor",
              style: TextStyles.nexaBold.copyWith(
                color: AppTheme.blackColor,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/svg/icons/docpng.png"),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr.Fady Mohamed Nabil",
                      style: TextStyles.nexaBold.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryTextColor,
                        fontSize: 18.sp,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Obstetrics and Gynecology Dep",
                      style: TextStyles.nexaRegular.copyWith(
                        color: AppTheme.secondaryTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(SVGAssets.money),
                        const SizedBox(width: 4),
                        Text(
                          "750 EGP",
                          style: TextStyles.nexaRegular.copyWith(
                            color: AppTheme.grey7Color,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ],
            ),
            const Divider(
              color: AppTheme.greyColor,
              thickness: 1,
            ),
            SizedBox(height: 24.h),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.bookingIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Jun 10, 2021 ',
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.clock,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '09:00 - 11:30 PM',
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}