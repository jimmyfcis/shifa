import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/models/radiolog_model.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/custom_button.dart';

class RecordsDetailBody extends StatelessWidget {
  final RecordType recordType;
  final RecordsModel radiologyReport;

  const RecordsDetailBody(
      {super.key, required this.radiologyReport, required this.recordType});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppTheme.greyColor, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          radiologyReport.title,
                          style: TextStyles.nexaBold.copyWith(
                            fontSize: 14.sp,
                            color: AppTheme.primaryTextColor,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: themeProvider.currentTheme == ThemeEnum.shifa
                                ? AppTheme.secondaryColorShifa
                                : AppTheme.secondaryColorLeksell,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Text(
                            radiologyReport.status,
                            style: TextStyles.nexaRegular.copyWith(
                              fontSize: 13.sp,
                              color:
                                  themeProvider.currentTheme == ThemeEnum.shifa
                                      ? AppTheme.shifaPrimaryColor
                                      : AppTheme.leksellPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 94.h,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.blackColor.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, -1),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: CustomButton(
              width: 1.sw,
              buttonColor: themeProvider.currentTheme == ThemeEnum.shifa
                  ? AppTheme.shifaPrimaryColor
                  : AppTheme.leksellPrimaryColor,
              borderColor: themeProvider.currentTheme == ThemeEnum.shifa
                  ? AppTheme.shifaPrimaryColor
                  : AppTheme.leksellPrimaryColor,
              height: 42.h,
              borderRadius: 8.r,
              fontSize: 14.sp,
              textColor: AppTheme.whiteColor,
              customWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SVGAssets.downloadIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    recordType == RecordType.radiology
                        ? "Download Report"
                        : "Download Results",
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 16.sp,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
