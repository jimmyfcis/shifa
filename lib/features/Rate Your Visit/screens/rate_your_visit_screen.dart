import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Rate%20Your%20Visit/widgets/rate_your_visit_content.dart';

class RateYourVisitScreen extends StatelessWidget {
  const RateYourVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      height: 105,
      alignment: Alignment.bottomCenter,
      appBarChild: const CommonAppBarTitle(title: "Rate Your Visit"),
      contentChild: const RateYourVisitContent(),
    );
  }
}
