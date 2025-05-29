import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/models/doctor_model.dart';

import '../../../core/assets/images/image_assets.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';

class DoctorSecondBookingCard extends StatelessWidget {
  const DoctorSecondBookingCard({
    super.key,
    required this.themeProvider,
    required this.date,
    required this.time,
    required this.doctor,
    this.image,
  });

  final String date;
  final String? image;
  final String time;
  final Doctor doctor;

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.currentTheme == ThemeEnum.shifa ? AppTheme.billColor : AppTheme.secondaryColorLeksell,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: image != null && image!.isNotEmpty
                      ? CachedNetworkImage(
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: themeProvider.currentThemeData!.primaryColor,
                            ), // Loading spinner
                          ),
                          imageUrl: image ?? "",
                          fit: BoxFit.fitHeight,
                          width: 50.w,
                          height: 50.h,
                        )
                      : Image.asset(
                          ImageAssets.drWaleedImg,
                          fit: BoxFit.fitHeight,
                          width: 50.w,
                          height: 50.h,
                        ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? doctor.nameAR ?? "" : doctor.name ?? "",
                      style: TextStyles.nexaBold.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryTextColor,
                        fontSize: 18.sp,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isArabic ? doctor.specialist?.nameAr ?? "" : doctor.specialist?.name ?? "",
                      style: TextStyles.nexaRegular.copyWith(
                        color: AppTheme.secondaryTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Row(
                    //   children: [
                    //     SvgPicture.asset(SVGAssets.money),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       "750 EGP",
                    //       style: TextStyles.nexaRegular.copyWith(
                    //         color: AppTheme.grey7Color,
                    //         fontSize: 12.sp,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                        date,
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
                        time,
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
