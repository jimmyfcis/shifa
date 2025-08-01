import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/images/image_assets.dart';
import '../../../../core/models/doctor_model.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/theme/theme.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.doctor,
    required this.themeProvider,
    required this.isArabic,
  });

  final Doctor doctor;
  final ThemeProvider themeProvider;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.doctorProfile, arguments: {
          "clinicId": doctor.clinics!.first.clinicId,
          "doctorId": doctor.id.toString(),
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: AppTheme.whiteColor,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: doctor.image != null && doctor.image!.isNotEmpty
                        ? CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: themeProvider.currentThemeData!.primaryColor,
                              ), // Loading spinner
                            ),
                            imageUrl: doctor.image ?? "",
                            width: 85.w,
                            height: 85.h,
                          )
                        : Image.asset(
                            ImageAssets.doctorAvatar,
                            width: 85.w,
                            height: 85.h,
                          ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    isArabic ? doctor.nameAR ?? "" : doctor.name ?? "",
                    maxLines: 2,
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 14.sp,
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         height: 16.h,
                //       ),
                //
                //       // SizedBox(
                //       //   height: 8.h,
                //       // ),
                //       // Text(
                //       //   isArabic ? doctor.specialist?.nameAr ?? "" : doctor.specialist?.nameEn ?? "",
                //       //   style: TextStyles.nexaRegular.copyWith(
                //       //     fontSize: 12.sp,
                //       //     color: AppTheme.secondaryTextColor,
                //       //   ),
                //       // ),
                //       // const Spacer(),
                //       // Container(
                //       //   width: 45.w,
                //       //   padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                //       //   decoration: BoxDecoration(
                //       //     color: themeProvider.currentTheme == ThemeEnum.shifa
                //       //         ? AppTheme.billColor
                //       //         : AppTheme.secondaryColorLeksell,
                //       //     borderRadius: BorderRadius.circular(4.r),
                //       //   ),
                //       //   child: Row(
                //       //     children: [
                //       //       SvgPicture.asset(
                //       //         SVGAssets.star,
                //       //         color: themeProvider.currentTheme == ThemeEnum.shifa
                //       //             ? AppTheme.shifaPrimaryColor
                //       //             : AppTheme.leksellPrimaryColor,
                //       //       ),
                //       //       SizedBox(
                //       //         width: 2.w,
                //       //       ),
                //       //       Text(
                //       //         doctor.rate??"",
                //       //         style: TextStyles.nexaRegular.copyWith(
                //       //           fontSize: 12.sp,
                //       //           color: themeProvider.currentTheme == ThemeEnum.shifa
                //       //               ? AppTheme.shifaPrimaryColor
                //       //               : AppTheme.leksellPrimaryColor,
                //       //         ),
                //       //       ),
                //       //     ],
                //       //   ),
                //       // )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
