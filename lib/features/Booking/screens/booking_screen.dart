import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_child_theme.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Booking/widgets/appointment_body.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      alignment: Alignment.center,
      appBarChild: const CommonAppBarChildTheme(title: 'Appointments'),
      hasBorderRadius: true,
      contentChild: const Expanded(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: AppointmentBody(),
        ),
      ),
      height: 148,
    );
  }
}
