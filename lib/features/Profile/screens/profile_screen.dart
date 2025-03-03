import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Profile/widgets/profile_app_bar.dart';
import 'package:shifa/features/Profile/widgets/profile_widget.dart';
import 'package:shifa/features/Profile/widgets/user_name_phone_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.profileBGColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const ProfileAppBar(),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const UserNameAndPhoneNumber(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 16.w, top: 16.w, bottom: 16.w),
                    child: Column(
                      children: [
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Profile Page");
                          },
                          svgIcon: SVGAssets.profileIcon,
                          title: 'Profile',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Medical Insurance Page");
                          },
                          svgIcon: SVGAssets.medicalInsuranceIcon,
                          title: 'Medical Insurance',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("My Favorite Page");
                          },
                          svgIcon: SVGAssets.myFavoriteIcon,
                          title: 'My Favorite',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: false,
                          onTap: () {
                            log("Blogs Page");
                          },
                          svgIcon: SVGAssets.blogsIcon,
                          title: 'Blogs',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 16.w, top: 16.w, bottom: 16.w),
                    child: Column(
                      children: [
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Settings Page");
                            Navigator.pushNamed(context, AppRoutes.settings);
                          },
                          svgIcon: SVGAssets.settingsIcon,
                          title: 'Settings',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Terms and Conditions Page");
                            Navigator.pushNamed(
                                context, AppRoutes.termsAndConditions);
                          },
                          svgIcon: SVGAssets.termsAndConditionsIcon,
                          title: 'Terms and Conditions',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Privacy Policy Page");
                            Navigator.pushNamed(
                                context, AppRoutes.privacyPolicy);
                          },
                          svgIcon: SVGAssets.privacyPolicyIcon,
                          title: 'Privacy Policy',
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: false,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.contactUs);
                            log("Contact Us Page");
                          },
                          svgIcon: SVGAssets.contactUsIcon,
                          title: 'Contact Us',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 16.w, top: 16.w, bottom: 16.w),
                    child: ProfileWidget(
                      hasDivider: false,
                      onTap: () {
                        log("logout");
                      },
                      svgIcon: SVGAssets.logoutIcon,
                      title: 'Logout',
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
