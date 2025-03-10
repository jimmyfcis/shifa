import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/models/radiolog_model.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';

class RecordCard extends StatelessWidget {
  final String icon;
  final RecordsModel recordReport;
  final String title;
  final RecordType recordType;

  const RecordCard(
      {super.key,
      required this.recordReport,
      required this.recordType,
      required this.icon,
      this.title = "Radiology"});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMM, yyyy').format(
            DateFormat('dd MMM, yyyy').parse(recordReport.date),
          ),
          style: TextStyles.nexaBold.copyWith(
            fontSize: 16.sp,
            color: AppTheme.primaryTextColor,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        GestureDetector(
          onTap: () {
            log("Radiology Report");
            Navigator.pushNamed(context, AppRoutes.recordsDetails, arguments: {
              "record": recordReport,
              "title": title,
              "recordType": recordType
            });
          },
          child: Container(
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
                      icon,
                      width: 22.w,
                      height: 22.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      title,
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
                      recordReport.date,
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
                      recordReport.doctorName,
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
        ),
      ],
    );
  }
}
