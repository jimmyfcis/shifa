import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Contact%20us/widgets/contact_us_body.dart';
import 'package:provider/provider.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return  WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: ContactUsBody(),
      appBarChild: CommonAppBarTitle(
        title: 'Contact Us',
      ),
      height: 105,
      alignment: Alignment.bottomCenter,
    );
  }
}
