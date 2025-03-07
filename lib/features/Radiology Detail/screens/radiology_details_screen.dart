import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/models/radiolog_model.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Radiology%20Detail/widgets/radiology_detail_body.dart';

class RadiologyDetailsScreen extends StatelessWidget {
  final RadiologyModel radiologyReport;

  const RadiologyDetailsScreen({super.key, required this.radiologyReport});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      appBarChild: const CommonAppBarTitle(title: "Radiology"),
      height: 105,
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      contentChild: RadiologyDetailBody(
        radiologyReport: radiologyReport,
      ),
    );
  }
}
