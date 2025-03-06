import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_button.dart';
import 'package:shifa/features/Rate%20Your%20Visit/widgets/doctor_card.dart';
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
                  Text(
                    "Write Your Notes",
                    style: TextStyles.nexaRegular.copyWith(
                      fontSize: 14.sp,
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 77.h,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: null,
                      // Normal textInputField will be displayed
                      maxLines: 5,
                      // When user presses enter it will adapt to it
                      decoration: InputDecoration(
                        hintText: 'Enter your notes',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: AppTheme.greyColor,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: AppTheme.greyColor,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
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
                CustomButton(
                  width: 155.w,
                  buttonColor: Colors.transparent,
                  borderColor: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.shifaPrimaryColor
                      : AppTheme.leksellPrimaryColor,
                  height: 42.h,
                  borderRadius: 8.r,
                  fontSize: 14.sp,
                  textColor: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.shifaPrimaryColor
                      : AppTheme.leksellPrimaryColor,
                  title: "Cancel",
                  onpress: () {
                    Navigator.pop(context);
                  },
                ),
                CustomButton(
                  width: 155.w,
                  buttonColor: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.shifaPrimaryColor
                      : AppTheme.leksellPrimaryColor,
                  borderColor: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.shifaPrimaryColor
                      : AppTheme.leksellPrimaryColor,
                  height: 42.h,
                  borderRadius: 8.r,
                  fontSize: 14.sp,
                  textColor: AppTheme.whiteColor,
                  title: "Submit",
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
