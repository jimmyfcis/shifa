import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';

class RecordSingleItem extends StatelessWidget {
  const RecordSingleItem({
    super.key,
    required this.themeProvider,
    required this.title,
    this.date,
  });

  final ThemeProvider themeProvider;
  final String? title;
  final String? date;

  @override
  Widget build(BuildContext context) {
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
                themeProvider.currentTheme == ThemeEnum.leksell
                    ? SVGAssets.clincsLeksellIcon
                    : SVGAssets.clincsShifaIcon,
                width: 22.w,
                height: 22.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  title ?? "",
                  style: TextStyles.nexaBold.copyWith(
                    fontSize: 14.sp,
                    color: AppTheme.primaryTextColor,
                  ),
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
              if (date != null && date!.isNotEmpty)
                Text(
                  date??"",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: 14.sp,
                    color: AppTheme.secondaryTextColor,
                  ),
                ),
            ],
          ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       SVGAssets.stethoscopeIcon,
          //       width: 22.w,
          //       height: 22.h,
          //     ),
          //     SizedBox(
          //       width: 8.w,
          //     ),
          //     Text(
          //       "Dr.Fady Mohamed Nabil",
          //       style: TextStyles.nexaRegular.copyWith(
          //         fontSize: 14.sp,
          //         color: AppTheme.secondaryTextColor,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
