import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';

class CommonAppBarChildTheme extends StatelessWidget {
  final String? title;
  final Widget? child;

  const CommonAppBarChildTheme({super.key, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
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
                          width: 32.w,
                          height: 32.h,
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
          SizedBox(height: 8.h),
          child ??
              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              )
        ],
      ),
    );
  }
}
