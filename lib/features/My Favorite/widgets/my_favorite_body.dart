import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/widgtes/clinic_doctor_card.dart';

import '../../../core/models/clinic_model.dart';
import '../../../core/models/doctor_model.dart';

class MyFavoriteBody extends StatelessWidget {
  final Doctor? doctor;
  final Clinic clinic;
  const MyFavoriteBody({super.key, this.doctor, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 16.h,
        ),
        itemBuilder: (context, index) =>  ClinicDoctorCard(
          isFavorite: true, clinic: clinic,doctor: doctor,
        ),
      ),
    );
  }
}
