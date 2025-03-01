import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CommonAppBar(
          backGroundColor: HexColor("4270b7"),
          hasBorderRadius: true,
          height: 148,
        ),
        Padding(
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
                  Row(
                    spacing: 8.w,
                    children: [
                      SvgPicture.asset(
                        SVGAssets.leksellHomeWhiteIcon,
                        width: 32.w,
                        height: 36.h,
                      ),
                      SvgPicture.asset(
                        SVGAssets.leksellDivider,
                        width: 1.w,
                        height: 36.h,
                      ),
                      SvgPicture.asset(
                        SVGAssets.leksellText,
                        width: 1.w,
                        height: 36.h,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor("EEF7F4").withValues(alpha: 0.2),
                    ),
                    child: SvgPicture.asset(SVGAssets.notificationIcon),
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
        )
      ],
    );
  }
}
