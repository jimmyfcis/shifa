import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CommonAppBar(
      alignment: Alignment.center,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: true,
      height: 148,
      appBarChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                themeProvider.currentTheme == ThemeEnum.shifa
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SVGAssets.shifaIcon,
                            color: Colors.white,
                            width: 1.w,
                            height: 36.h,
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            SVGAssets.shifaText,
                            color: Colors.white,
                            width: 82.w,
                          )
                        ],
                      )
                    : Row(
                        children: [
                          SvgPicture.asset(
                            SVGAssets.leksellHomeWhiteIcon,
                            width: 32.w,
                            height: 36.h,
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            SVGAssets.leksellDivider,
                            width: 1.w,
                            height: 36.h,
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            SVGAssets.leksellText,
                            width: 1.w,
                            height: 36.h,
                          ),
                        ],
                      ),
                GestureDetector(
                  onTap: () {
                    themeProvider.changeTheme(
                        themeProvider.currentTheme == ThemeEnum.shifa
                            ? ThemeEnum.leksell
                            : ThemeEnum.shifa);
                  },
                  child: SvgPicture.asset(
                    themeProvider.currentTheme != ThemeEnum.shifa
                        ? SVGAssets.shifaHome
                        : SVGAssets.leksellHome,
                    width: 1.w,
                    height: 36.h,
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
