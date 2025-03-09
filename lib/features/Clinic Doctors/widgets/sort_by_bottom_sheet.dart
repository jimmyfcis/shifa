import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

void showSortByBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      String? _selectedOption;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
          return Container(
            decoration: const BoxDecoration(
              color: AppTheme.whiteColor,
              // Change this to your desired background color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sort By',
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 17.sp,
                      color: AppTheme.blackColor,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: <Widget>[
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('High Rate'),
                        value: 'high_rate',
                        activeColor:
                            themeProvider.currentThemeData!.primaryColor,
                        groupValue: _selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Low Rate'),
                        value: 'low_rate',
                        contentPadding: EdgeInsets.zero,
                        groupValue: _selectedOption,
                        activeColor:
                            themeProvider.currentThemeData!.primaryColor,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('High Price'),
                        value: 'high_price',
                        contentPadding: EdgeInsets.zero,
                        groupValue: _selectedOption,
                        activeColor:
                            themeProvider.currentThemeData!.primaryColor,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Low Price'),
                        value: 'low_price',
                        contentPadding: EdgeInsets.zero,
                        groupValue: _selectedOption,
                        activeColor:
                            themeProvider.currentThemeData!.primaryColor,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
