import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/features/Booking/widgets/cancel_your_visit_dialogue.dart';

import '../data/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final int tabSelectedIndex;
  final Appointment appointment;

  const AppointmentCard({super.key, required this.tabSelectedIndex,required this.appointment});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Card(
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(
          width: 1,
          color: AppTheme.greyColor,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      ImageAssets.drWaleedImg,
                      fit: BoxFit.fitHeight,
                      width: 46.w,
                      height: 46.h,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctor?.name??"",
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        appointment.doctor?.descriptionEn??"",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SVGAssets.bookingIcon,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            appointment.date??"",
                            style: TextStyles.nexaRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppTheme.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SVGAssets.clock,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            appointment.time??"",
                            style: TextStyles.nexaRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppTheme.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: AppTheme.greyColor,
              height: 1.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomWhiteButton(
                    title: tabSelectedIndex == 0
                        ? "Cancel Your Visit"
                        : "Rate Your Visit",
                    onPressed: () {
                      if (tabSelectedIndex == 0) {
                        showDialog(
                          barrierDismissible: true,
                          // Allows dismissing by tapping outside
                          context: context,
                          builder: (BuildContext context) {
                            return CancelYourVisitDialogue(
                                themeProvider: themeProvider);
                          },
                        );
                      } else {
                        Navigator.pushNamed(context, AppRoutes.rateYourVisit);
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: CustomGreenButton(
                    title: tabSelectedIndex == 0 ? "Reschedule" : "Book Again",
                    fontSize: 14,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.doctorProfile);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
