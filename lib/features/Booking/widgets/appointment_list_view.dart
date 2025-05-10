import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'appointment_card.dart';

class AppointmentListView extends StatelessWidget {
  final int tabSelectedIndex;
  final List<Appointment> appointments;

  const AppointmentListView({
    super.key,
    required this.tabSelectedIndex,
    required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: appointments.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 16.h,
      ),
      padding: EdgeInsets.only(top: 24.h),
      itemBuilder: (context, index) => AppointmentCard(
        tabSelectedIndex: tabSelectedIndex,
        appointment: appointments[index],
      ),
    );
  }
}
