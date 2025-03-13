import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/core/widgtes/doctor_card.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Rate%20Your%20Visit/widgets/rating_title_bar.dart';

class RateYourVisitContent extends StatelessWidget {
  const RateYourVisitContent({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

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
                  const DoctorCard(),
                  SizedBox(
                    height: 24.h,
                  ),
                  const RatingTitleBar(title: 'Rate The Doctor'),
                  SizedBox(
                    height: 24.h,
                  ),
                  const RatingTitleBar(title: 'Nursing Staff'),
                  SizedBox(
                    height: 24.h,
                  ),
                  const RatingTitleBar(title: 'Receptionist'),
                  SizedBox(
                    height: 24.h,
                  ),
                  const RatingTitleBar(title: 'Hospitality'),
                  SizedBox(
                    height: 24.h,
                  ),
                  const RatingTitleBar(title: 'Waiting time'),
                  SizedBox(
                    height: 24.h,
                  ),
                  const CustomTextField(
                    name: "Write Your Notes",
                    labelText: "Write Your Notes",
                    maxLines: 3,
                    hintText: "Enter Your Notes",
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
                  offset: Offset(0, -1),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                const Expanded(
                  child: CustomGreenButton(
                    title: "Submit",
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
