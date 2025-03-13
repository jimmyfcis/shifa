import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/features/Doctors/widgets/booking_radio_steps.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/watermark_widget.dart';
import '../widgets/booking_step_indicator.dart';
import '../widgets/my_self_booking_details.dart';
import '../widgets/someone_booking_details.dart';

class FirstBookingScreen extends StatefulWidget {
  const FirstBookingScreen({super.key});

  @override
  State<FirstBookingScreen> createState() => _FirstBookingScreenState();
}

class _FirstBookingScreenState extends State<FirstBookingScreen> {
  int selectedStep = 0;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 0, right: 24.w, left: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BookingStepIndicator(
                      step: "Step 1", title: "Patient Details", index: 0, themeProvider: themeProvider),
                  SizedBox(width: 8.w),
                  BookingStepIndicator(
                      step: "Step 2", title: "Appointment Details", index: 1, themeProvider: themeProvider),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            BookingRadioSteps(
              selectedStep: selectedStep,
              themeData: themeProvider.currentThemeData!,
              onChanged: (value) {
                setState(() {
                  selectedStep = value!;
                });
              },
            ),
            SizedBox(height: 20.h),
            Expanded(child: SingleChildScrollView(child: _buildStepContent())),
            Card(
              color: AppTheme.whiteColor,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: const ContinuousRectangleBorder(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 10.h),
                child: CustomGreenButton(
                  onPressed: (){
                    Navigator.pushNamed(context, AppRoutes.secondBookingScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (selectedStep) {
      case 0:
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: const MySelfBookingDetails(),
        );
      case 1:
        return Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w),
          child: const SomeoneBookingDetails(),
        );
      default:
        return Container();
    }
  }
}
