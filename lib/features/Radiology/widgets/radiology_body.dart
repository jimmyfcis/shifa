import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/core/widgtes/record_card.dart';

class RadiologyBody extends StatelessWidget {
  const RadiologyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppConstants().recordsList.isEmpty
            ? const NoRecordWidget(
                icon: SVGAssets.radiologyIcon,
              )
            : ListView.separated(
                itemCount: AppConstants().recordsList.length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                  height: 24.h,
                ),
                itemBuilder: (context, index) {
                  return RecordCard(
                    recordReport: AppConstants().recordsList[index],
                    icon: SVGAssets.radiologyIcon,
                    recordType: RecordType.radiology,
                  );
                },
              ),
      ),
    );
  }
}
