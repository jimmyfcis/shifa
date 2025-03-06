import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_child_theme.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/My%20Care/widgets/my_care_body.dart';

class MyCareScreen extends StatelessWidget {
  const MyCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      alignment: Alignment.center,
      appBarChild: const CommonAppBarChildTheme(title: 'My Care'),
      hasBorderRadius: true,
      contentChild: const Expanded(
        child: MyCareBody(),
      ),
      height: 148,
    );
  }
}
