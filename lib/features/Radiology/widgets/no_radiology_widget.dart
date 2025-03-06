import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class NoRadiologyWidget extends StatelessWidget {
  const NoRadiologyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGAssets.radiologyIcon,
            width: 77.w,
            height: 77.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'you didn’t have any records yet.',
            style: TextStyles.nexaRegular.copyWith(
              fontSize: 14.sp,
              color: AppTheme.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
