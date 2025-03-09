import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/select_from_list_bottom_sheet.dart';

void showFilterByBottomSheet(BuildContext context) {
  String? selectedGender = "all";
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // This makes the bottom sheet take full height
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
          return Container(
            height: MediaQuery.of(context).size.height - 20,
            decoration: const BoxDecoration(
              color: AppTheme.whiteColor,
              // Change this to your desired background color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                const CommonAppBarTitle(
                  title: "Filter By",
                  iconColor: AppTheme.primaryTextColor,
                  textColor: AppTheme.primaryTextColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              name: "Select Speciality",
                              labelText: "Select Speciality",
                              hintText: "Select Speciality",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  SVGAssets.arrowDown,
                                  color: AppTheme.black2Color,
                                ),
                              ),
                              readOnly: true,
                              onTap: () {
                                log("Select Speciality");
                                selectFromListBottomSheet(
                                    context: context,
                                    list: AppConstants().specialities,
                                    title: "Select Speciality",
                                    hint: "Speciality..");
                              },
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  SVGAssets.stethoscopeIcon,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CustomTextField(
                              name: "Select doctor job title",
                              labelText: "Select doctor job title",
                              hintText: "Job Title",
                              readOnly: true,
                              onTap: () {
                                log("Job Title");
                                selectFromListBottomSheet(
                                    context: context,
                                    list: AppConstants().doctorsJobTitle,
                                    title: "Select Job Title",
                                    hint: "Job Title..");
                              },
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  SVGAssets.arrowDown,
                                  color: AppTheme.black2Color,
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  SVGAssets.stethoscopeIcon,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primaryTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: RadioListTile<String>(
                                      contentPadding: EdgeInsets.zero,
                                      title: const Text('All'),
                                      value: 'all',
                                      activeColor: themeProvider
                                          .currentThemeData!.primaryColor,
                                      groupValue: selectedGender,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: RadioListTile<String>(
                                      title: const Text('Male'),
                                      value: 'male',
                                      contentPadding: EdgeInsets.zero,
                                      groupValue: selectedGender,
                                      activeColor: themeProvider
                                          .currentThemeData!.primaryColor,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: RadioListTile<String>(
                                      title: const Text('Female'),
                                      value: 'female',
                                      contentPadding: EdgeInsets.zero,
                                      groupValue: selectedGender,
                                      activeColor: themeProvider
                                          .currentThemeData!.primaryColor,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  //
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomGreenButton(
                              title: "Apply filter",
                              fontSize: 16.sp,
                            ),
                            SizedBox(height: 16.h),
                            CustomWhiteButton(
                              title: "Clear filter",
                              fontSize: 16.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
