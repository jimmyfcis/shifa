import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class CommonAppBarTitle extends StatelessWidget {
  final String title;
  final Widget? actionButton;
  final bool? hasBackButton;
  final Color? textColor;
  final Color? iconColor;

  const CommonAppBarTitle({
    super.key,
    required this.title,
    this.actionButton,
    this.hasBackButton = true,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 24.w,
      ),
      child: Row(
        mainAxisAlignment: (hasBackButton ?? true)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (hasBackButton ?? true)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: isArabic?SvgPicture.asset(
              SVGAssets.arrowRight,
              width: 24.w,
              height: 24.h,
                color: AppTheme.whiteColor,
              )
                  :SvgPicture.asset(
                SVGAssets.arrowBack,
                colorFilter: ColorFilter.mode(
                  iconColor ?? AppTheme.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.nexaBold.copyWith(
                  color: textColor ?? AppTheme.whiteColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          if (hasBackButton ?? true) actionButton ?? const SizedBox(),
        ],
      ),
    );
  }
}
