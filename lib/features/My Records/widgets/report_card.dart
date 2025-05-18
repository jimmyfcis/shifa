import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/data/models/records_response_model.dart';
import 'package:shifa/features/My%20Records/widgets/diagnose_card_title.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.medicalReport});
  final MedicalReport medicalReport;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
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
                themeProvider.currentTheme == ThemeEnum.shifa
                    ? SVGAssets.diagnoseShifa
                    : SVGAssets.diagnoseLeksell,
                width: 22.w,
                height: 22.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Medical Report",
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
           DiagnoseCardTitle(
            title: "Report Name",
            subTitle: medicalReport.reportName??"",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),
           DiagnoseCardTitle(
            title: "Report Date",
            subTitle: medicalReport.visitEnddate??"",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),

           DiagnoseCardTitle(
            title: "Report Type",
            subTitle: medicalReport.visitTypeEn??"",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),
           DiagnoseCardTitle(
            title: "Record Serial",
            subTitle: medicalReport.serial??"",
            hasDivider: false,
          ),
        ],
      ),
    );
  }
}
