import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'appointment_card.dart';

class PastAppointmentsListView extends StatelessWidget {
  final List<Appointment> appointments;

  const PastAppointmentsListView({
    super.key,
    required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    return appointments.isEmpty
        ?  Center(child: Text(context.tr.translate('no_appointments')))
        : ListView.separated(
            itemCount: appointments.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
            padding: EdgeInsets.only(top: 24.h),
            itemBuilder: (context, index) => AppointmentCard(
              tabSelectedIndex: 1,
              appointment: appointments[index],
            ),
          );
  }
}
