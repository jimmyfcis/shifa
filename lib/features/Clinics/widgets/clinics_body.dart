import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Clinics/widgets/clinic_item.dart';

class ClinicsBody extends StatelessWidget {
  const ClinicsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              name: "Search For Clinic..",
              hasName: false,
              labelText: "Search For Clinic..",
              hintText: "Search For Clinic..",
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
            Expanded(
              child: GridView.builder(
                itemCount: AppConstants().clinics.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ClinicItem(
                  clinic: AppConstants().clinics[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
