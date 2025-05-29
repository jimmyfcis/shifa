import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/departments/data/models/department_model.dart';

class DepartmentDetailsScreen extends StatelessWidget {
  final DepartmentModel department;
  const DepartmentDetailsScreen({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      appBarChild: CommonAppBarTitle(title: isArabic?department.titleAr??"":department.titleEn??""),
      height: 105,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      contentChild: Expanded(
        child: Stack(
          children: [
            Image.network(
              "https://prelive.shifaegypt.com/front_assets/images/15.jpg",
              width: 375.w,
              height: 320.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 290.h, // Start below the image
              bottom: 0, // Extend to the bottom of the screen
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic?department.descriptionAr??"":department.description??"",
                        style: TextStyles.nexaBold.copyWith(
                            fontSize: 18.sp, color: AppTheme.primaryTextColor),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        isArabic?department.contentAr??"":department.contentEn??"",
                        style: TextStyles.nexaRegular.copyWith(
                          color: AppTheme.secondaryTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
