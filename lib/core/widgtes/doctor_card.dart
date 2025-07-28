import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';

class DoctorCard extends StatelessWidget {
  final Appointment appointment;

  const DoctorCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: appointment.doctor?.image != null && appointment.doctor!.image!.isNotEmpty
                        ? CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: themeProvider.currentThemeData!.primaryColor,
                              ), // Loading spinner
                            ),
                            imageUrl: appointment.doctor?.image ?? "",
                            fit: BoxFit.fitHeight,
                            width: 46.w,
                            height: 46.h,
                          )
                        : Image.asset(
                            ImageAssets.drWaleedImg,
                            width: 46.w,
                            height: 46.h,
                          ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        isArabic ? appointment.doctor?.nameAR ?? "" : appointment.doctor?.name ?? "",
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text(
                          isArabic
                              ? appointment.doctor?.descriptionAr ?? ""
                              : appointment.doctor?.descriptionEn?? "",
                          maxLines: 1,
                          style: TextStyles.nexaRegular.copyWith(
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: AppTheme.secondaryTextColor,
                          ),
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
                          appointment.date ?? "",
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
      ),
    );
  }
}
