import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/core/assets/svg/assets.dart';

class ProfileWidget extends StatelessWidget {
  final bool hasDivider;
  final String svgIcon;
  final String title;
  final VoidCallback onTap;
  const ProfileWidget({
    super.key,
    required this.hasDivider,
    required this.onTap,
    required this.svgIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(
                    svgIcon,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                SVGAssets.arrowRight,
              ),
            ],
          ),
        ),
        if (hasDivider) ...[
          SizedBox(
            height: 16.h,
          ),
          Divider(
            color: HexColor("#E8E8E8"),
            height: 1.h,
          ),
        ]
      ],
    );
  }
}
