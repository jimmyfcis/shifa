import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Labs/data/models/lab_model.dart';

class LabRecordCard extends StatefulWidget {
  final Lab lab;

  const LabRecordCard(
      {super.key,
        required this.lab,
      });

  @override
  State<LabRecordCard> createState() => _LabRecordCardState();
}

class _LabRecordCardState extends State<LabRecordCard> {

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat("MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.startDate??"")),
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
            // log("Radiology Report");
            // Navigator.pushNamed(context, AppRoutes.recordsDetails, arguments: {
            //  // "record": recordReport,
            //   "title": widget.title,
            //   "recordType": widget.recordType
            // });
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
                      themeProvider.currentTheme == ThemeEnum.shifa
                          ? SVGAssets.labShifaIcon
                          : SVGAssets.labsLeksellIcon,
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
                      "${DateFormat("dd MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.startDate??""))} To ${DateFormat("dd MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.endDate??""))}",
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
                      isArabic?widget.lab.doctorNameAr??"":widget.lab.doctorNameEn??"",
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
