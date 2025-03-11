import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/watermark_widget.dart';

class FirstBookingScreen extends StatefulWidget {
  const FirstBookingScreen({super.key});

  @override
  State<FirstBookingScreen> createState() => _FirstBookingScreenState();
}

class _FirstBookingScreenState extends State<FirstBookingScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105.h,
      appBarChild: const CommonAppBarTitle(
        title: 'Book Appointment',
      ),
      contentChild: Expanded(
          child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Step 1",
                    style: TextStyles.nexaLight.copyWith(
                      color: AppTheme.grey3color,
                      fontWeight: FontWeight.w400,
                        fontSize: 11.sp
                    ),
                  ),
                  Text(
                    "Patient Details",
                    style: TextStyles.nexaRegular.copyWith(
                      color: AppTheme.primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
