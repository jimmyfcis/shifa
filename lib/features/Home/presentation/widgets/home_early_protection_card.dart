import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';

class HomeEarlyProtectionCard extends StatelessWidget {
  const HomeEarlyProtectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.currentTheme == ThemeEnum.shifa
            ? AppTheme.green4Color
            : AppTheme.secondaryColorLeksell,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 21.h,
              bottom: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr.translate("early_protection_title"),
                  style: TextStyles.nexaBold.copyWith(
                    color: AppTheme.textBlackColor,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomGreenButton(
                  title: context.tr.translate("learn_more"),
                  fontSize: 12.sp,
                  width: 95.w,
                  height: 30.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                  ),
                  borderRadius: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 10.h,
                  child: Image.asset(
                    ImageAssets.roundedWhiteCircle,
                    width: 110.w,
                    height: 113.h,
                  ),
                ),
                Image.asset(
                  ImageAssets.homeFemaleDoctor,
                  height: 131.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
