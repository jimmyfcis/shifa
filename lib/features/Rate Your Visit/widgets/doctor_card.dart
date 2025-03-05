import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(
          width: 1,
          color: AppTheme.greyColor,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    ImageAssets.drWaleedImg,
                    fit: BoxFit.fitHeight,
                    width: 46.w,
                    height: 46.h,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dr.Waleed Yousry',
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 16.sp,
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Professor of Oncology & General Surgery ',
                      style: TextStyles.nexaRegular.copyWith(
                        fontSize: 12.sp,
                        color: AppTheme.secondaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: AppTheme.greyColor,
              height: 1.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.bookingIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Jun 10, 2021 ',
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    color: AppTheme.greyColor,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.clock,
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '09:00 - 11:30 PM',
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
