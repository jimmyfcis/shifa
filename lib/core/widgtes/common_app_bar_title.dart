import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class CommonAppBarTitle extends StatelessWidget {
  final String title;

  const CommonAppBarTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 24.w,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              SVGAssets.arrowBack,
              colorFilter: const ColorFilter.mode(
                AppTheme.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyles.nexaBold.copyWith(
                  color: AppTheme.whiteColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
