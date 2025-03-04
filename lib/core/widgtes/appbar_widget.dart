import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';

class CommonAppBar extends StatelessWidget {
  final Color backGroundColor;
  final bool hasBorderRadius;
  final double height;
  final Widget appBarChild;
  final Alignment alignment;

  const CommonAppBar({
    super.key,
    required this.backGroundColor,
    required this.hasBorderRadius,
    required this.height,
    required this.appBarChild,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Container(
          width: 375.w,
          height: height.h,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: hasBorderRadius
                ? BorderRadius.only(
                    bottomRight: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r),
                  )
                : null,
          ),
          child: SvgPicture.asset(SVGAssets.appBarLogo),
        ),
        appBarChild,
      ],
    );
  }
}
