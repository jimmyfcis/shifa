import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';

class AuthAppbar extends StatefulWidget {
  final Widget body;
  final bool showBack;

  const AuthAppbar({super.key, required this.body, this.showBack = true});

  @override
  State<AuthAppbar> createState() => _AuthAppbarState();
}

class _AuthAppbarState extends State<AuthAppbar> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.onBoardingBG,
        leadingWidth: 100.w,
        leading: widget.showBack
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      border: Border.all(color: AppTheme.greyColor),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: isArabic
                        ? Transform.scale(
                            scaleX: -1,
                            child: Image.asset(
                              Assets.arrowLeft,
                              width: 24.w,
                              height: 24.h,
                            ),
                          )
                        : Image.asset(
                            Assets.arrowLeft,
                            width: 24.w,
                            height: 24.h,
                          ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
      backgroundColor: AppTheme.onBoardingBG,
      body: widget.body,
    );
  }
}
