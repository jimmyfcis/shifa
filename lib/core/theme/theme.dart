// core/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/utils/fonts/fonts_manager.dart';

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
  static const Color redColor = Color(0xFFFF3B30);
  static const Color secondaryColorShifa = Color(0xFFEBFEF4);
  static const Color hintColor = Color(0xFFB0B0B0);
  static const Color darkGreyColor = Color(0xFF3D3D3D);
  static const Color grey3color = Color(0xFF6D6D6D);
  static const Color green2Color = Color(0xFF);
  static const Color shifaPrimaryColor = Color(0xFF008D5C);
  static const Color green4Color = Color(0xFFEEF7F4);
  static const Color green5Color = Color(0xFF199A8E);
  static const Color grey5Color = Color(0xFF4F4F4F);
  static const Color grey6Color = Color(0xFF454545);
  static const Color grey7Color = Color(0xFF939F9B);
  static const Color blackColor = Color(0xFF000000);
  static const Color black2Color = Color(0xFF292D32);
  static const Color textBlackColor = Color(0xFF101623);
  static const Color whiteColor = Color(0xFFffffff);
  static const Color errorColor = Color(0xFFE53935);
}

ThemeData shifaThemeData = ThemeData(
    primaryColor: AppTheme.shifaPrimaryColor,
    primaryColorLight: AppTheme.shifaPrimaryColor,
    primaryColorDark: AppTheme.shifaPrimaryColor,
    //fontFamily: "Nexa",
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 4,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppTheme.shifaPrimaryColor),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      // White background

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      /// AM/PM Section
      dayPeriodColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme
              .shifaPrimaryColor; // Selected background color (green)
        }
        return AppTheme.whiteColor; // Unselected background color (light green)
      }),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (white)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dayPeriodTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaBold,
      ),
      dayPeriodBorderSide: BorderSide(color: Colors.transparent),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      /// Hour & Minute Display
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme
                .shifaPrimaryColor; // Selected background color (green)
          }
          return AppTheme
              .whiteColor; // Unselected background color (light green)
        },
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme.whiteColor; // Selected text color (white)
          }
          return AppTheme.primaryTextColor; // Unselected text color (black)
        },
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Dial Settings
      dialBackgroundColor: Colors.white,
      dialTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (green)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dialHandColor: AppTheme.shifaPrimaryColor,
      dialTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Time Separator
      entryModeIconColor: AppTheme.shifaPrimaryColor,
      timeSelectorSeparatorTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 24,
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
          height: 3.0,
          fontFamily: FontsAssets.nexaRegular,
        ),
      ),
      helpTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Buttons
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: FontsAssets.nexaRegular,
          ),
        ),
      ),

      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: FontsAssets.nexaRegular,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      dividerColor: AppTheme.shifaPrimaryColor,
      // todayBackgroundColor:
      //     MaterialStateProperty.all(AppTheme.shifaPrimaryColor),

      // todayForegroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.shifaPrimaryColor; // Your custom theme color
        }
        return null; // Use default
      }),

      // ✅ Set the text color for the selected day
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Ensure contrast with background
        }
        return null; // Use default
      }),
      rangeSelectionBackgroundColor: AppTheme.shifaPrimaryColor,
      todayBackgroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      todayForegroundColor:
          MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
      // Text color for selected day
      // dayForegroundColor:MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
      //  dayBackgroundColor:MaterialStateProperty.all(AppTheme.whiteColor) ,
      dayOverlayColor: MaterialStateProperty.all(AppTheme.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyles.nexaRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.shifaPrimaryColor,
        ),
        helperStyle: TextStyles.nexaRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.shifaPrimaryColor,
          //fontFamily: FontsAssets.Nexa,
        ),
        hintStyle: TextStyles.nexaRegular.copyWith(
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
          TextStyles.nexaRegular.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.shifaPrimaryColor,
            // //fontFamily: FontsAssets.Nexa,
          ),
        ), // No ripple effect
      ),

      //todayBackgroundColor: MaterialStateProperty.all(whiteColor),
      yearStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.blueAccent,
        ////fontFamily: FontsAssets.Nexa,
      ),
      // todayBorder: const BorderSide(
      //   color: Colors.brown,
      // ),
      headerHeadlineStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
        ////fontFamily: FontsAssets.Nexa,
      ),
      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.whiteColor,
            ////fontFamily: FontsAssets.Nexa,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
        // No ripple effect
        foregroundColor:
            MaterialStateProperty.all(AppTheme.whiteColor), // No ripple effect
      ),
      backgroundColor: AppTheme.whiteColor,
      dayStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      ),
      headerHelpStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent,
      ),
      dayShape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      // todayForegroundColor: MaterialStateProperty.all(primaryColor),

      weekdayStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme.shifaPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
ThemeData leksellThemeData = ThemeData(
    primaryColor: AppTheme.leksellPrimaryColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppTheme.leksellPrimaryColor),

    //fontFamily: "Nexa",
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 4,
    ),
    datePickerTheme: DatePickerThemeData(
      //todayBackgroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyles.nexaRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
        ),
        helperStyle: TextStyles.nexaRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
        ),
        hintStyle: TextStyles.nexaRegular.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.leksellPrimaryColor,
        ),
        constraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(AppTheme.leksellPrimaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyles.nexaRegular.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.leksellPrimaryColor,
          ),
        ), // No ripple effect
      ),

      //todayBackgroundColor: MaterialStateProperty.all(whiteColor),

      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.leksellPrimaryColor; // Your custom theme color
        }
        return null; // Use default
      }),

      // ✅ Set the text color for the selected day
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Ensure contrast with background
        }
        return null; // Use default
      }),
      rangeSelectionBackgroundColor: AppTheme.leksellPrimaryColor,
      todayBackgroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      todayForegroundColor:
          MaterialStateProperty.all(AppTheme.leksellPrimaryColor),
      // Text color for selected day
      // dayForegroundColor:MaterialStateProperty.all(AppTheme.shifaPrimaryColor),
      //  dayBackgroundColor:MaterialStateProperty.all(AppTheme.whiteColor) ,
      dayOverlayColor: MaterialStateProperty.all(AppTheme.whiteColor),

      yearStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.blueAccent,
        ////fontFamily: FontsAssets.Nexa,
      ),
      // todayBorder: const BorderSide(
      //   color: Colors.brown,
      // ),
      headerHeadlineStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
        ////fontFamily: FontsAssets.Nexa,
      ),
      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.whiteColor,
            ////fontFamily: FontsAssets.Nexa,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            AppTheme.leksellPrimaryColor), // No ripple effect
        foregroundColor:
            MaterialStateProperty.all(AppTheme.whiteColor), // No ripple effect
      ),
      backgroundColor: AppTheme.whiteColor,
      dayStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.red,
        ////fontFamily: FontsAssets.Nexa,
      ),
      headerHelpStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent,
        //fontFamily: FontsAssets.Nexa,
      ),
      dayShape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      // todayForegroundColor: MaterialStateProperty.all(primaryColor),
      weekdayStyle: TextStyles.nexaRegular.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
        //fontFamily: FontsAssets.Nexa,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      // White background

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      /// AM/PM Section
      dayPeriodColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme
              .leksellPrimaryColor; // Selected background color (green)
        }
        return AppTheme.whiteColor; // Unselected background color (light green)
      }),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (white)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dayPeriodTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaBold,
      ),
      dayPeriodBorderSide: BorderSide(color: Colors.transparent),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      /// Hour & Minute Display
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme
                .leksellPrimaryColor; // Selected background color (green)
          }
          return AppTheme
              .whiteColor; // Unselected background color (light green)
        },
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme.whiteColor; // Selected text color (white)
          }
          return AppTheme.primaryTextColor; // Unselected text color (black)
        },
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Dial Settings
      dialBackgroundColor: Colors.white,
      dialTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (green)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dialHandColor: AppTheme.leksellPrimaryColor,
      dialTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Time Separator
      entryModeIconColor: AppTheme.leksellPrimaryColor,
      timeSelectorSeparatorTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 24,
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
          height: 3.0,
          fontFamily: FontsAssets.nexaRegular,
        ),
      ),
      helpTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: FontsAssets.nexaRegular,
      ),

      /// Buttons
      cancelButtonStyle: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(AppTheme.leksellPrimaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: FontsAssets.nexaRegular,
          ),
        ),
      ),

      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: FontsAssets.nexaRegular,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(AppTheme.leksellPrimaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
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
