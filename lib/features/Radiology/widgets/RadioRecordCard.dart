import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Radiology/data/models/radiology_model.dart';

class RadioRecordCard extends StatefulWidget {
  final Radiology radiology;

  const RadioRecordCard(
      {super.key,
        required this.radiology,
        });

  @override
  State<RadioRecordCard> createState() => _RadioRecordCardState();
}

class _RadioRecordCardState extends State<RadioRecordCard> {

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        DateFormat("MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.radiology.date??"")),
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
                      SVGAssets.radiologyIcon,
                      width: 22.w,
                      height: 22.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      context.tr.translate("radiology"),
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
                      DateFormat("dd MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.radiology.date??"")),
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
                      isArabic?widget.radiology.doctorNameAr??"":widget.radiology.doctorNameEn??"",
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
