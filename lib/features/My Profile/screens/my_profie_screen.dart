import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/My%20Profile/widgets/my_profile_widget.dart';
import 'package:shifa/features/authentication/data/models/user.dart';

import '../../../core/storage/token_storage.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  User? userData;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final storage = TokenStorage();
    final user = await storage.getUser();
    if (mounted && user != null) {
      setState(() {
        userData = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      height: 105,
      alignment: Alignment.bottomCenter,
      appBarChild: CommonAppBarTitle(
        title: context.tr.translate("profile"),
        // actionButton: GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(context, AppRoutes.editProfile);
        //   },
        //   child: Text(
        //     context.tr.translate("edit"),
        //     style: TextStyles.nexaBold.copyWith(
        //       fontSize: 18.sp,
        //       shadows: [Shadow(color: Colors.white, offset: Offset(0, -4))],
        //       color: Colors.transparent,
        //       decoration: TextDecoration.underline,
        //       decorationColor: AppTheme.whiteColor,
        //     ),
        //   ),
        // ),
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
                  child: userData?.image != null && userData!.image!.isNotEmpty
                      ? Image.network(
                          userData?.image ?? "",
                        )
                      : Image.asset(
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
                  if(userData?.name != null && userData!.name!.isNotEmpty) MyProfileWidget(title: context.tr.translate("name"), subTitle: userData?.name ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  if(userData?.birthdate != null && userData!.birthdate!.isNotEmpty)    MyProfileWidget(title: context.tr.translate("date_of_birth"), subTitle: userData?.birthdate ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  if(userData?.gender != null && userData!.gender!.isNotEmpty)  MyProfileWidget(title: context.tr.translate("gender"), subTitle: userData?.gender ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  // if(userData?.image != null && userData!.image!.isNotEmpty) MyProfileWidget(
                  //     title: "Blood Type", subTitle: userData?.??"", hasDivider: true),
                  // SizedBox(
                  //   height: 16.h,
                  // ),
                  if(userData?.email != null && userData!.email!.isNotEmpty)  MyProfileWidget(title: context.tr.translate("email_field"), subTitle: userData?.email ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  if(userData?.phoneNumber != null && userData!.phoneNumber!.isNotEmpty)  MyProfileWidget(title: context.tr.translate("phone_number"), subTitle: userData?.phoneNumber ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),
                  if(userData?.maritalStatus != null && userData!.maritalStatus!.isNotEmpty)  MyProfileWidget(title: context.tr.translate("martial_status"), subTitle: userData?.maritalStatus ?? "", hasDivider: true),
                  SizedBox(
                    height: 16.h,
                  ),

                  if(userData?.address != null && userData!.address!.isNotEmpty)   MyProfileWidget(title: context.tr.translate("address"), subTitle: userData?.address ?? "", hasDivider: false),
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
