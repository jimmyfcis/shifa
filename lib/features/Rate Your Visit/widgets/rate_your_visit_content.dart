import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/core/widgtes/doctor_card.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Rate%20Your%20Visit/widgets/rating_title_bar.dart';

class RateYourVisitContent extends StatelessWidget {
  const RateYourVisitContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   DoctorCard(appointment: Appointment(),),
                  SizedBox(
                    height: 24.h,
                  ),
                  RatingTitleBar(title: context.tr.translate("rate_the_doctor")),
                  SizedBox(
                    height: 24.h,
                  ),
                  RatingTitleBar(title: context.tr.translate("nursing_staff")),
                  SizedBox(
                    height: 24.h,
                  ),
                  RatingTitleBar(title: context.tr.translate("receptionist")),
                  SizedBox(
                    height: 24.h,
                  ),
                  RatingTitleBar(title: context.tr.translate("hospitality")),
                  SizedBox(
                    height: 24.h,
                  ),
                  RatingTitleBar(title: context.tr.translate("waiting_time")),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    name: "notes",
                    labelText: context.tr.translate("write_your_notes"),
                    maxLines: 3,
                    hintText: context.tr.translate("enter_your_notes"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 94.h,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.blackColor.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, -1),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomWhiteButton(
                    title: context.tr.translate("cancel"),
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
                    title: context.tr.translate("submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
