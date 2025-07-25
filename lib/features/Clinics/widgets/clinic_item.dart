import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/models/clinic_model.dart';

import '../../../core/assets/svg/svg_assets.dart';

class ClinicItem extends StatelessWidget {
  final Clinic clinic;

  const ClinicItem({
    super.key,
    required this.clinic,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Container(
      width: 98.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppTheme.greyColor,
                width: 1,
              ),
            ),
            child: Center(
              child: clinic.icon!=null&&clinic.icon!.isNotEmpty?CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: themeProvider.currentThemeData!.primaryColor,
                  ), // Loading spinner
                ),
                imageUrl: clinic.icon ?? "",
                fit: BoxFit.fitHeight,
                width: 34.w,
                height: 34.h,
              ):SvgPicture.asset(
                SVGAssets.painIcon,
                width: 34.w,
                height: 34.h,
                color: themeProvider.currentTheme == ThemeEnum.shifa
                    ? AppTheme.shifaPrimaryColor
                    : AppTheme.leksellPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
           isArabic?clinic.nameAr??"": clinic.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyles.nexaRegular.copyWith(
              fontSize: 13.sp,
              overflow: TextOverflow.ellipsis,
              color: AppTheme.primaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
