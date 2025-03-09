import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';

class ClinicDoctorCard extends StatelessWidget {
  const ClinicDoctorCard({super.key});

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
                Expanded(
                  child: Column(
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
                        height: 8.h,
                      ),
                      Text(
                        'Professor of Oncology & General Surgery ',
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SVGAssets.star,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '4.5',
                            style: TextStyles.nexaRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SVGAssets.money,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '750 EGP',
                            style: TextStyles.nexaRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(
                  SVGAssets.myFavoriteIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomGreenButton(
              fontSize: 14.sp,
              title: "Book an appointment",
            ),
          ],
        ),
      ),
    );
  }
}
