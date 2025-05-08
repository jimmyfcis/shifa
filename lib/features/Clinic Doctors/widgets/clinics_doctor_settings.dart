import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/filter_by_bottom_sheet.dart';
import 'package:shifa/features/Clinic%20Doctors/widgets/sort_by_bottom_sheet.dart';

import 'custom_icon_container.dart';

class ClinicsDoctorSettings extends StatelessWidget {
  const ClinicsDoctorSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          name: "Search For Doctors..",
          hasName: false,
          labelText: "Search For Doctors..",
          hintText: "Search For Doctors..",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              SVGAssets.clinicsIcon,
              width: 20.w,
              height: 20.h,
              color: AppTheme.grey7Color,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            CustomIconContainer(
              icon: SVGAssets.calendarIcon,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  // Handle the selected date
                  print(pickedDate.toString());
                }
              },
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: CustomIconContainer(
                icon: SVGAssets.filterIcon,
                label: "Filter by",
                onTap: () {
                  showFilterByBottomSheet(context);
                },
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: CustomIconContainer(
                icon: SVGAssets.sortIcon,
                label: "Sort by",
                onTap: () {
                  showSortByBottomSheet(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
