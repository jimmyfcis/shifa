import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/core/widgtes/record_card.dart';

class LabTestsBody extends StatelessWidget {
  const LabTestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppConstants().recordsList.isEmpty
            ? NorRecordWidget(
                icon: themeProvider.currentTheme == ThemeEnum.shifa
                    ? SVGAssets.labShifaIcon
                    : SVGAssets.labsLeksellIcon,
              )
            : ListView.separated(
                itemCount: AppConstants().labTestsList.length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                  height: 24.h,
                ),
                itemBuilder: (context, index) {
                  return RecordCard(
                    recordReport: AppConstants().labTestsList[index],
                    icon: themeProvider.currentTheme == ThemeEnum.shifa
                        ? SVGAssets.labShifaIcon
                        : SVGAssets.labsLeksellIcon,
                    recordType: RecordType.labTest,
                    title: "Lab Test",
                  );
                },
              ),
      ),
    );
  }
}
