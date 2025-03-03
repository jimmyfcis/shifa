import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/theme/theme.dart';

class AuthAppbar extends StatefulWidget {
  final Widget body;

  const AuthAppbar({super.key, required this.body});

  @override
  State<AuthAppbar> createState() => _AuthAppbarState();
}

class _AuthAppbarState extends State<AuthAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.onBoardingBG,
        leading: InkWell(
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
            child: Image.asset(
              Assets.arrowLeft,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.onBoardingBG,
      body: widget.body,
    );
  }
}
