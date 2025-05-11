import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/features/Home/data/models/doctor_model.dart';

class ClinicDoctorCard extends StatelessWidget {
  final bool isFavorite;
  final Doctor? doctor;

  const ClinicDoctorCard({super.key, required this.isFavorite,  this.doctor});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
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
                        doctor?.name??"",
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        doctor?.descriptionEn??"",
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
                            doctor?.rate??"5",
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
                  isFavorite
                      ? (themeProvider.currentTheme == ThemeEnum.shifa
                          ? SVGAssets.myFavoriteFillShifaIcon
                          : SVGAssets.myFavoriteFillLeksellIcon)
                      : SVGAssets.myFavoriteSolidIcon,
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
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.doctorProfile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
