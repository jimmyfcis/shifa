import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';

class HomeTopDoctor extends StatelessWidget {
  const HomeTopDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Top Doctor',
              style: TextStyles.nexaBold.copyWith(
                fontSize: 16.sp,
                color: AppTheme.textBlackColor,
              )),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 235.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(
              width: 16.w,
            ),
            itemBuilder: (context, index) => Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 18.h,
              ),
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        ImageAssets.doctorAvatar,
                        width: 85.w,
                        height: 85.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    AppConstants.topRateDoctorModel.name,
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 14.sp,
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AppConstants.topRateDoctorModel.speciality,
                    style: TextStyles.nexaRegular.copyWith(
                      fontSize: 12.sp,
                      color: AppTheme.secondaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 40.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: themeProvider.currentTheme == ThemeEnum.shifa
                          ? AppTheme.billColor
                          : AppTheme.secondaryColorLeksell,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SVGAssets.star,
                          color: themeProvider.currentTheme == ThemeEnum.shifa
                              ? AppTheme.shifaPrimaryColor
                              : AppTheme.leksellPrimaryColor,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          AppConstants.topRateDoctorModel.rate.toString(),
                          style: TextStyles.nexaRegular.copyWith(
                            fontSize: 12.sp,
                            color: themeProvider.currentTheme == ThemeEnum.shifa
                                ? AppTheme.shifaPrimaryColor
                                : AppTheme.leksellPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
