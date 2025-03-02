// core/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    fontFamily: "Nexa",
  );
  static const Color primaryColor = Color(0xFF008D5C);
  static const Color onBoardingBG = Color(0xFFFAFAFA);
  static const Color greyColor = Color(0xFFE8E8E8);
  static const Color billColor = Color(0xFFEEF7F4);
  static Color profileBGColor = HexColor("FAFAFAF");
  static const Color primaryColorLeksell = Color(0xFF4270B7);
  static const Color secondaryColorLeksell = Color(0xFFECF1F8);

  static const Color grey4Color = Color(0xFF);
  static const Color grey3color = Color(0xFF);
  static const Color green2Color = Color(0xFF);
  static const Color green4Color = Color(0xFFEEF7F4);
  static const Color green3Color = Color(0xFF);
  static const Color grey2Color = Color(0xFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFffffff);

// If dark theme support is needed, add it here as well.
}
