import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/widgets/diagnose_card_title.dart';

class DiagnoseCard extends StatelessWidget {
  const DiagnoseCard({super.key});

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
                "Diagnose",
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
          const DiagnoseCardTitle(
            title: "Diagnose or condition description",
            subTitle: "irritable bowel syndrome",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          const DiagnoseCardTitle(
            title: "Diagnose Date",
            subTitle: "05/04/1999",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          const DiagnoseCardTitle(
            title: "Is it chronic?",
            subTitle: "No",
            hasDivider: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          const DiagnoseCardTitle(
            title: "Occurrence",
            subTitle: "Acute",
            hasDivider: false,
          ),
        ],
      ),
    );
  }
}
