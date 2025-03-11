import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';

class RemindersCard extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final ReminderType reminderType;

  const RemindersCard(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.reminderType});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    leadingIcon,
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
              SvgPicture.asset(
                SVGAssets.trash,
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          if (reminderType == ReminderType.medical) ...[
            Row(
              children: [
                SvgPicture.asset(
                  SVGAssets.pill,
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "1 tab/Day",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: 14.sp,
                    color: AppTheme.secondaryTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
          if (reminderType == ReminderType.care) ...[
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
            SizedBox(
              height: 16.h,
            ),
          ],
          Row(
            children: [
              SvgPicture.asset(
                SVGAssets.calendarIcon,
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
            height: 16.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SVGAssets.clock,
                width: 22.w,
                height: 22.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "10:30 PM",
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppTheme.secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
