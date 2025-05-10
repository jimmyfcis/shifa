import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Clinics/widgets/clinic_item.dart';

import '../../../core/network/injection_container.dart';
import '../presentation/cubit/clinics_cubit.dart';
import '../presentation/cubit/clinics_state.dart';

class ClinicsBody extends StatelessWidget {
  const ClinicsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocProvider(
          create: (context) {
            final cubit = sl<ClinicsCubit>();
            cubit.fetchClinics(); // Call the method immediately after creating the cubit
            return cubit;
          },
          child: BlocBuilder<ClinicsCubit, ClinicState>(
            builder: (context, state) {
              return state is ClinicLoading
                  ? Center(
                    child: CircularProgressIndicator(
                        color: themeProvider.currentThemeData!.primaryColor,
                      ),
                  )
                  : state is ClinicLoaded ?Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          name: "Search For Clinic..",
                          hasName: false,
                          labelText: "Search For Clinic..",
                          hintText: "Search For Clinic..",
                          onChanged: (value)
                          {

                          },
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
                            itemCount:state.clinicsResponse.clinics.length,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) {
                            var clinic=  state.clinicsResponse.clinics[index];
                              return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.clinicDoctors,
                                  arguments: clinic.name,
                                );
                              },
                              child: ClinicItem(
                                clinic: clinic,
                              ),
                            );
                            },
                          ),
                        ),
                      ],
                    ):SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
