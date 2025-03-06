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

class RadiologyCard extends StatelessWidget {
  final RadiologyModel radiologyReport;

  const RadiologyCard({super.key, required this.radiologyReport});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMM, yyyy').format(
            DateFormat('dd MMM, yyyy').parse(radiologyReport.date),
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
            Navigator.pushNamed(context, AppRoutes.radiologyDetail,
                arguments: radiologyReport);
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
                      SVGAssets.radiologyIcon,
                      width: 22.w,
                      height: 22.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Radiology",
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
                      radiologyReport.date,
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
                      radiologyReport.doctorName,
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
