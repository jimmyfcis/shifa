import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/widgets/medicine_record_card.dart';

class MedicinesCard extends StatelessWidget {
  const MedicinesCard({super.key});

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
        children: [
          const MedicineRecordCard(),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 1,
            color: AppTheme.greyColor,
          ),
          SizedBox(
            height: 16.h,
          ),
          const MedicineRecordCard(),
        ],
      ),
    );
  }
}
