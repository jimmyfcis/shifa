import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/features/Home/presentation/widgets/upcoming_appointment.dart';
import 'home_available_service_widget.dart';
import 'home_early_protection_card.dart';
import 'home_health_article.dart';
import 'home_top_doctor.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            const HomeAvailableService(),
            SizedBox(
              height: 24.h,
            ),
            const HomeEarlyProtectionCard(),
            SizedBox(
              height: 24.h,
            ),
            const UpcomingAppointment(),
            SizedBox(
              height: 24.h,
            ),
            const HomeTopDoctor(),
            SizedBox(
              height: 24.h,
            ),
            const HomeHealthArticle(),
            SizedBox(
              height: 64.h,
            ),
          ],
        ),
      ),
    );
  }
}
