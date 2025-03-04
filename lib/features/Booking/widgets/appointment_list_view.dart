import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_card.dart';

class AppointmentListView extends StatelessWidget {
  final int tabSelectedIndex;

  const AppointmentListView({super.key, required this.tabSelectedIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: 16.h,
      ),
      padding: EdgeInsets.only(top: 24.h),
      itemBuilder: (context, index) => AppointmentCard(
        tabSelectedIndex: tabSelectedIndex,
      ),
    );
  }
}
