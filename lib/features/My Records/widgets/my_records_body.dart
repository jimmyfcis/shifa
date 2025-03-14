import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/features/My%20Records/widgets/diagnose_card.dart';
import 'package:shifa/features/My%20Records/widgets/lab_tests_radiology_records.dart';
import 'package:shifa/features/My%20Records/widgets/medicines_card.dart';

import '../../../core/assets/svg/svg_assets.dart';

class MyRecordsBody extends StatelessWidget {
  const MyRecordsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppConstants().recordsList.isEmpty
            ? NoRecordWidget(
                icon: themeProvider.currentTheme == ThemeEnum.leksell
                    ? SVGAssets.clincsLeksellIcon
                    : SVGAssets.clincsShifaIcon,
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('MMM, yyyy').format(
                        DateFormat('dd MMM, yyyy').parse(
                          "21 Oct, 2024",
                        ),
                      ),
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 16.sp,
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppTheme.greyColor, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                themeProvider.currentTheme == ThemeEnum.leksell
                                    ? SVGAssets.clincsLeksellIcon
                                    : SVGAssets.clincsShifaIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "Examination",
                                style: TextStyles.nexaBold.copyWith(
                                  fontSize: 14.sp,
                                  color: AppTheme.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                SVGAssets.bookingIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "21 Oct, 2024",
                                style: TextStyles.nexaRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppTheme.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                SVGAssets.stethoscopeIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "Dr.Fady Mohamed Nabil",
                                style: TextStyles.nexaRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppTheme.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      DateFormat('MMM, yyyy').format(
                        DateFormat('dd MMM, yyyy').parse(
                          "21 Oct, 2024",
                        ),
                      ),
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 16.sp,
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const DiagnoseCard(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const MedicinesCard(),
                    SizedBox(
                      height: 16.h,
                    ),
                    LabTestsRadiologyRecordsCard(
                      title: "Lab Tests",
                      icon: themeProvider.currentTheme == ThemeEnum.leksell
                          ? SVGAssets.labsLeksellIcon
                          : SVGAssets.labShifaIcon,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const LabTestsRadiologyRecordsCard(
                      title: "Radiology",
                      icon: SVGAssets.radiologyIcon,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
