import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/doctor_card.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Appointment',
                style: TextStyles.nexaBold.copyWith(
                  fontSize: 16.sp,
                  color: AppTheme.textBlackColor,
                ),
              ),
              Text(
                'See All',
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 12.sp,
                  color: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.green5Color
                      : AppTheme.leksellPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 145.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const DoctorCard(),
          ),
        ),
      ],
    );
  }
}
