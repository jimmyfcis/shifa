import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/My%20Profile/widgets/my_profile_widget.dart';

class MyProfie extends StatelessWidget {
  const MyProfie({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      height: 105,
      alignment: Alignment.bottomCenter,
      appBarChild: CommonAppBarTitle(
        title: "My Profile",
        actionButton: GestureDetector(
          onTap: () {
            log("Edit Profile");
          },
          child: Text(
            "Edit",
            style: TextStyles.nexaBold.copyWith(
              fontSize: 18.sp,
              shadows: [Shadow(color: Colors.white, offset: Offset(0, -4))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: AppTheme.whiteColor,
            ),
          ),
        ),
      ),
      contentChild: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.greyColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    ImageAssets.myProfileImg,
                  ),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyProfileWidget(
                      title: "Name", subTitle: "Ahmed Salah", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Date Of Birth",
                      subTitle: "05/04/1999",
                      hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Gender", subTitle: "Male", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Blood Type", subTitle: "O+", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Email",
                      subTitle: "Ahmed.salah32@gmail.com",
                      hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Phone Number",
                      subTitle: "+201098037023",
                      hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MyProfileWidget(
                      title: "Martial Status",
                      subTitle: "Married",
                      hasDivider: false),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              )))
            ],
          ),
        ),
      ),
    );
  }
}
