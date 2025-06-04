import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/clinic_doctor_card.dart';
import 'package:shifa/core/models/doctor_model.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/models/clinic_model.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';

class ClinicDoctorsBody extends StatefulWidget {
  final List<Doctor> doctors;
  final Clinic clinic;

  const ClinicDoctorsBody({super.key, required this.doctors, required this.clinic});

  @override
  State<ClinicDoctorsBody> createState() => _ClinicDoctorsBodyState();
}

class _ClinicDoctorsBodyState extends State<ClinicDoctorsBody> {
  late List<Doctor> filteredDoctors;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    filteredDoctors = widget.doctors;
  }
  void _filterDoctors(String? query) {
    setState(() {
      final searchText = (query ?? '').toLowerCase();
      filteredDoctors = widget.doctors
          .where((doctor) => doctor.name!.toLowerCase().contains(searchText)|| doctor.nameAR!.contains(searchText))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppTheme.onBoardingBG,
            boxShadow: [
              BoxShadow(
                color: AppTheme.blackColor.withOpacity(0.16),
                blurRadius: 4,
              ),
            ],
          ),
          child: CustomTextField(
            name: "search",
            hasName: false,
            onChanged: _filterDoctors,
            labelText: context.tr.translate("search_doctor"),
            hintText: context.tr.translate("search_doctor"),
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
        ),
        Expanded(
          child: filteredDoctors.isEmpty
              ? Center(child: Text(context.tr.translate("no_doctors_found")))
              : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: filteredDoctors.length,
            itemBuilder: (context, index) => ClinicDoctorCard(
              isFavorite: false,
              doctor: filteredDoctors[index],
              clinic: widget.clinic,
            ),
          ),
        )
      ],
    );
  }
}

