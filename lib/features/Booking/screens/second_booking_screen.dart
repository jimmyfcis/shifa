import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/models/doctor_model.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/watermark_widget.dart';
import '../../Doctors/widgets/booking_step_indicator.dart';
import '../../Doctors/widgets/confirm_booking_dialogue.dart';
import '../../Doctors/widgets/doctor_second_booking_card.dart';

class SecondBookingScreen extends StatefulWidget {
  const SecondBookingScreen({super.key, required this.clinicID, required this.doctorId, required this.date, required this.time, required this.mobile, required this.name, required this.doctor});

  final String clinicID;
  final String doctorId;
  final String date;
  final String time;
  final String mobile;
  final String name;
  final Doctor doctor;

  @override
  State<SecondBookingScreen> createState() => _SecondBookingScreenState();
}

class _SecondBookingScreenState extends State<SecondBookingScreen> {
  bool switchValue = false;
  int selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105.h,
      appBarChild:  CommonAppBarTitle(
        title: context.tr.translate("book_appointment"),
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
                      step: "Step 1", title: context.tr.translate("patient_details"), index: 0, themeProvider: themeProvider),
                  SizedBox(width: 8.w),
                  BookingStepIndicator(
                      step: "Step 2", title: context.tr.translate("appointment_details"), index: 0, themeProvider: themeProvider),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    DoctorSecondBookingCard(themeProvider: themeProvider, date: widget.date, time: widget.time, doctor: widget.doctor,),
                    // SizedBox(height: 30.h),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Have Medical Insurance",
                    //         style: TextStyles.nexaRegular.copyWith(
                    //           fontSize: 16.sp,
                    //           color: AppTheme.primaryTextColor,
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       Switch(
                    //         activeTrackColor: themeProvider.currentThemeData!.primaryColor,
                    //         inactiveTrackColor: AppTheme.greyColor,
                    //         thumbColor: MaterialStateProperty.all<Color>(AppTheme.whiteColor),
                    //         value: switchValue,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             switchValue = value;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: themeProvider.currentTheme == ThemeEnum.shifa
                    //         ? AppTheme.billColor
                    //         : AppTheme.secondaryColorLeksell,
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(24.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Payment",
                    //           style: TextStyles.nexaBold.copyWith(
                    //             color: AppTheme.blackColor,
                    //             fontSize: 16.sp,
                    //           ),
                    //         ),
                    //         SizedBox(height: 16.h),
                    //         const PaymentValue(
                    //           title: "Total due",
                    //           value: "750 EGP",
                    //         ),
                    //         if (switchValue) ...[
                    //           SizedBox(height: 16.h),
                    //           const PaymentValue(
                    //             title: "Medical percentage",
                    //             value: "450 EGP",
                    //           ),
                    //           SizedBox(height: 16.h),
                    //           const Divider(color: AppTheme.greyColor),
                    //           SizedBox(height: 16.h),
                    //           const PaymentValue(
                    //             title: "Total Payment",
                    //             value: "300 EGP",
                    //           ),
                    //         ]
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 24.h),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                    //   child: PaymentRadioGroup(
                    //     selectedPaymentMethod: selectedPaymentMethod,
                    //     themeData: themeProvider.currentThemeData!,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedPaymentMethod = value!;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Card(
              color: AppTheme.whiteColor,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: const ContinuousRectangleBorder(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomWhiteButton(
                        title: "Cancel",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CustomGreenButton(
                        title: "Confirm",
                        fontSize: 14,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: true, // Allows dismissing by tapping outside
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmBookingDialogue(themeProvider: themeProvider);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
