import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class NoRecordWidget extends StatelessWidget {
  final String icon;
  final String? title;

  const NoRecordWidget({super.key, required this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 77.w,
            height: 77.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            title ?? context.tr.translate("no_records"),
            textAlign: TextAlign.center,
            style: TextStyles.nexaRegular.copyWith(
              fontSize: 14.sp,
              color: AppTheme.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
