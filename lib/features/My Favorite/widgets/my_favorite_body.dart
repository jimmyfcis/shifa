import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/clinic_doctor_card.dart';

class MyFavoriteBody extends StatelessWidget {
  const MyFavoriteBody({super.key});

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
        itemBuilder: (context, index) => const ClinicDoctorCard(
          isFavorite: true,
        ),
      ),
    );
  }
}
