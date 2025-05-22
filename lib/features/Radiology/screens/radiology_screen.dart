import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Radiology/widgets/radiology_body.dart';

class RadiologyScreen extends StatelessWidget {
  const RadiologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      appBarChild:  CommonAppBarTitle(title: context.tr.translate("radiology")),
      contentChild: const RadiologyBody(),
    );
  }
}
