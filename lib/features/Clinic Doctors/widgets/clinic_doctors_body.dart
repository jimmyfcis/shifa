import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/clinic_doctor_card.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/clinics_doctor_settings.dart';
import 'package:shifa/core/models/doctor_model.dart';

import '../../../core/models/clinic_model.dart';

class ClinicDoctorsBody extends StatelessWidget {
  final List<Doctor> doctors;
  final Clinic clinic;
  const ClinicDoctorsBody({super.key, required this.doctors,required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: AppTheme.onBoardingBG,
            boxShadow: [
              BoxShadow(
                color: AppTheme.blackColor.withOpacity(0.16),
                blurRadius: 4,
              ),
            ],
          ),
          child: const ClinicsDoctorSettings(),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 16.h,
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
            itemCount: doctors.length,
            itemBuilder: (context, index) =>  ClinicDoctorCard(
              isFavorite: false,
              doctor: doctors[index],
              clinic: clinic,
            ),
          ),
        )
      ],
    );
  }
}
