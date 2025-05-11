import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'appointment_card.dart';

class UpcomingAppointmentsListView extends StatelessWidget {
  final List<Appointment> appointments;

  const UpcomingAppointmentsListView({
    super.key,
    required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    return appointments.isEmpty
        ? const Center(child: Text('No appointments found'))
        : ListView.separated(
            itemCount: appointments.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
            padding: EdgeInsets.only(top: 24.h),
            itemBuilder: (context, index) => AppointmentCard(
              tabSelectedIndex: 0,
              appointment: appointments[index],
            ),
          );
  }
}
