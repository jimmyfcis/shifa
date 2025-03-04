// core/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static const Color leksellPrimaryColor = Color(0xFF4270B7);
  static const Color primaryTextColor = Color(0xFF262626);
  static const Color secondaryTextColor = Color(0xFF5D5D5D);
  static const Color leksellSecondaryColor = Color(0xFFD0FBE3);
  static const Color onBoardingBG = Color(0xFFFAFAFA);
  static const Color greyColor = Color(0xFFE8E8E8);
  static const Color billColor = Color(0xFFEEF7F4);
  static Color profileBGColor = HexColor("FAFAFAF");
  static const Color secondaryColorLeksell = Color(0xFFECF1F8);
  static const Color hintColor = Color(0xFFB0B0B0);
  static const Color darkGreyColor = Color(0xFF3D3D3D);
  static const Color grey3color = Color(0xFF);
  static const Color green2Color = Color(0xFF);
  static const Color shifaPrimaryColor = Color(0xFF008D5C);
  static const Color green4Color = Color(0xFFEEF7F4);
  static const Color green3Color = Color(0xFF);
  static const Color grey2Color = Color(0xFF);
  static const Color grey5Color = Color(0xFF4F4F4F);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFffffff);
  static const Color offWhiteColor = Color(0xFFE8E8E8);
}

ThemeData shifaThemeData = ThemeData(
    primaryColor: AppTheme.shifaPrimaryColor,
    //fontFamily: "Nexa",
    datePickerTheme: DatePickerThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.shifaPrimaryColor,
          //fontFamily: FontsAssets.Nexa,
        ),
        helperStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.shifaPrimaryColor,
          //fontFamily: FontsAssets.Nexa,
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.shifaPrimaryColor,
          // //fontFamily: FontsAssets.Nexa,
        ),
        constraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.shifaPrimaryColor,
            // //fontFamily: FontsAssets.Nexa,
          ),
        ), // No ripple effect
      ),

      //todayBackgroundColor: MaterialStateProperty.all(whiteColor),
      yearStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.blueAccent,
        ////fontFamily: FontsAssets.Nexa,
      ),
      // todayBorder: const BorderSide(
      //   color: Colors.brown,
      // ),
      headerHeadlineStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
        ////fontFamily: FontsAssets.Nexa,
      ),
      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.whiteColor,
            ////fontFamily: FontsAssets.Nexa,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.shifaPrimaryColor), // No ripple effect
        foregroundColor: MaterialStateProperty.all(AppTheme.whiteColor), // No ripple effect
      ),
      backgroundColor: AppTheme.whiteColor,
      dayStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.red,
        ////fontFamily: FontsAssets.Nexa,
      ),
      headerHelpStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent,
        //fontFamily: FontsAssets.Nexa,
      ),
      dayShape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      // todayForegroundColor: MaterialStateProperty.all(primaryColor),
      weekdayStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
        //fontFamily: FontsAssets.Nexa,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme.shifaPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
ThemeData leksellThemeData = ThemeData(
    primaryColor: AppTheme.leksellPrimaryColor,
    //fontFamily: "Nexa",
    datePickerTheme: DatePickerThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
          //fontFamily: FontsAssets.Nexa,
        ),
        helperStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
          //fontFamily: FontsAssets.Nexa,
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
          // //fontFamily: FontsAssets.Nexa,
        ),
        constraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppTheme.leksellPrimaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.leksellPrimaryColor,
            // //fontFamily: FontsAssets.Nexa,
          ),
        ), // No ripple effect
      ),

      //todayBackgroundColor: MaterialStateProperty.all(whiteColor),
      yearStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.blueAccent,
        ////fontFamily: FontsAssets.Nexa,
      ),
      // todayBorder: const BorderSide(
      //   color: Colors.brown,
      // ),
      headerHeadlineStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
        ////fontFamily: FontsAssets.Nexa,
      ),
      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.whiteColor,
            ////fontFamily: FontsAssets.Nexa,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.leksellPrimaryColor), // No ripple effect
        foregroundColor: MaterialStateProperty.all(AppTheme.whiteColor), // No ripple effect
      ),
      backgroundColor: AppTheme.whiteColor,
      dayStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.red,
        ////fontFamily: FontsAssets.Nexa,
      ),
      headerHelpStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent,
        //fontFamily: FontsAssets.Nexa,
      ),
      dayShape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      // todayForegroundColor: MaterialStateProperty.all(primaryColor),
      weekdayStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
        //fontFamily: FontsAssets.Nexa,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme.leksellPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));

enum ThemeEnum { shifa, leksell }

class ThemeProvider extends ChangeNotifier {
  ThemeEnum currentTheme = ThemeEnum.shifa;
  ThemeData? currentThemeData;

  static ThemeProvider? _instance;

  static ThemeProvider get instance {
    _instance ??= ThemeProvider._init();
    return _instance!;
  }

  ThemeProvider._init();

  Future<void> changeTheme(ThemeEnum theme) async {
    currentTheme = theme;
    _generateThemeData();
    notifyListeners();
  }

  void _generateThemeData() {
    currentThemeData = getTheme();
  }

  ThemeData getTheme() {
    switch (currentTheme) {
      case ThemeEnum.shifa:
        return shifaThemeData;
      case ThemeEnum.leksell:
        return leksellThemeData;
      default:
        return shifaThemeData;
    }
  }
}
