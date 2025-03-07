import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/features/Radiology/widgets/no_radiology_widget.dart';
import 'package:shifa/features/Radiology/widgets/radiology_card.dart';

class RadiologyBody extends StatelessWidget {
  const RadiologyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppConstants().radiologyList.isEmpty
            ? const NoRadiologyWidget()
            : ListView.separated(
                itemCount: AppConstants().radiologyList.length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                  height: 24.h,
                ),
                itemBuilder: (context, index) {
                  return RadiologyCard(
                    radiologyReport: AppConstants().radiologyList[index],
                  );
                },
              ),
      ),
    );
  }
}
