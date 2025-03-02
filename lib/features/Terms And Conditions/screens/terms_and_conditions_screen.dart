import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WaterMark(
      backGroundColor: AppTheme.primaryColorLeksell,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105,
      appBarChild: Padding(
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
                  'Terms and Conditions',
                  style: TextStyles.nexaBold.copyWith(
                    color: AppTheme.whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      contentChild: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Text(
              AppConstants.lognText,
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.secondaryTextColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
