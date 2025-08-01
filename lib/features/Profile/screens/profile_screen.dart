import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Profile/widgets/profile_app_bar.dart';
import 'package:shifa/features/Profile/widgets/profile_widget.dart';
import 'package:shifa/features/Profile/widgets/user_name_phone_widget.dart';

import '../../../core/network/injection_container.dart';
import '../../authentication/presentation/cubit/logout/logout_cubit.dart';
import '../../authentication/presentation/cubit/logout/logout_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.profileBGColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const ProfileAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  const UserNameAndPhoneNumber(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    color: AppTheme.whiteColor,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 16.w, top: 16.w, bottom: 16.w),
                    child: Column(
                      children: [
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("Profile Page");
                            Navigator.pushNamed(context, AppRoutes.myProfile);
                          },
                          svgIcon: SVGAssets.profileIcon,
                          title: context.tr.translate('profile'),
                        ),
                        SizedBox(height: 16.h),
                        // ProfileWidget(
                        //   hasDivider: true,
                        //   onTap: () {
                        //     log("Medical Insurance Page");
                        //   },
                        //   svgIcon: SVGAssets.medicalInsuranceIcon,
                        //   title: context.tr.translate('medical_insurance'),
                        // ),
                        // SizedBox(height: 16.h),
                        // ProfileWidget(
                        //   hasDivider: true,
                        //   onTap: () {
                        //     log("My Favorite Page");
                        //     Navigator.pushNamed(context, AppRoutes.myFavorite,arguments: {
                        //       "clinic":Clinic(name: "", doctors: []),
                        //       "doctor":Doctor(),
                        //     },);
                        //   },
                        //   svgIcon: SVGAssets.myFavoriteSolidIcon,
                        //   title: context.tr.translate('my_favorite'),
                        // ),
                        // SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: false,
                          onTap: () {
                            log("Blogs Page");
                            Navigator.pushNamed(context, AppRoutes.blogs);
                          },
                          svgIcon: SVGAssets.blogsIcon,
                          title: context.tr.translate('blogs'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    color: AppTheme.whiteColor,
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
                          title: context.tr.translate('settings'),
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: true,
                          onTap: () {
                            log("change password Page");
                            Navigator.pushNamed(context, AppRoutes.changePassword);
                          },
                          svgIcon: SVGAssets.settingsIcon,
                          title: context.tr.translate('change_password'),
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
                          title: context.tr.translate('terms_conditions'),
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
                          title: context.tr.translate('privacy_policy'),
                        ),
                        SizedBox(height: 16.h),
                        ProfileWidget(
                          hasDivider: false,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.contactUs);
                            log("Contact Us Page");
                          },
                          svgIcon: SVGAssets.contactUsIcon,
                          title: context.tr.translate('contact_us'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    color: AppTheme.whiteColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.w,
                    ).copyWith(left: 24.w),
                    child: BlocProvider(
                      create: (context) => sl<LogoutCubit>(),
                      child: BlocConsumer<LogoutCubit, LogoutState>(
                        listener: (context, state) {
                          if (state is LogoutSuccess) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.login, (route) => false);
                          } else if (state is LogoutFailure) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.login, (route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LogoutLoading) {
                            return Center(child: CircularProgressIndicator(color: themeProvider.currentThemeData!.primaryColor,));
                          }
                          return ProfileWidget(
                            hasDivider: false,
                            onTap: () {
                              log("Logout");
                              context.read<LogoutCubit>().logout();
                            },
                            svgIcon: SVGAssets.logoutIcon,
                            title: context.tr.translate('logout'),
                          );
                        },
                      ),
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
