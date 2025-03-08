import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';

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
            const CustomIconContainer(
              icon: SVGAssets.calendarIcon,
              label: null,
            ),
            SizedBox(
              width: 8.w,
            ),
            const CustomIconContainer(
              icon: SVGAssets.filterIcon,
              label: "Filter by",
            ),
            SizedBox(
              width: 8.w,
            ),
            const CustomIconContainer(
              icon: SVGAssets.sortIcon,
              label: "Sort by",
            ),
          ],
        )
      ],
    );
  }
}
