import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/clinic_doctors_body.dart';
import 'package:shifa/features/Clinics/data/models/clinic_model.dart';

class ClinicDoctorsScreen extends StatelessWidget {
  final Clinic clinic;

  const ClinicDoctorsScreen({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: CommonAppBarTitle(title: clinic.name),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild:  Expanded(child: ClinicDoctorsBody(doctors: clinic.doctors??[],)),
    );
  }
}
