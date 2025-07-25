import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Clinics/widgets/clinic_item.dart';

import '../../../core/network/injection_container.dart';
import '../../../core/theme/styles.dart';
import '../presentation/cubit/clinics_cubit.dart';
import '../presentation/cubit/clinics_state.dart';

class ClinicsBody extends StatefulWidget {
  const ClinicsBody({super.key});

  @override
  State<ClinicsBody> createState() => _ClinicsBodyState();
}

class _ClinicsBodyState extends State<ClinicsBody> {
  final TextEditingController _searchController = TextEditingController();
  ClinicsCubit? _clinicsCubit;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocProvider(
          create: (context) {
            final cubit = sl<ClinicsCubit>();
            _clinicsCubit = cubit;
            cubit.fetchClinics(
              isLekxell: themeProvider.currentTheme == ThemeEnum.shifa ? null : true,
            ); // Call the method immediately after creating the cubit
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
                  : state is ClinicLoaded
                      ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  controller: _searchController,
                                  name: "clinic",
                                  hasName: false,
                                  labelText: context.tr.translate("search_for_clinic"),
                                  hintText: context.tr.translate("search_for_clinic"),
                                  onChanged: (value) {
                                    // Call the search method in the cubit
                                    _clinicsCubit?.searchClinics(value ?? '');
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
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear, size: 20.w, color: AppTheme.grey7Color),
                                    onPressed: () {
                                      _searchController.clear();
                                      _clinicsCubit?.searchClinics('');
                                    },
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                state.clinicsResponse.clinics.isEmpty
                                    ? Expanded(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                context.tr.translate("no_clinics_found"),
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: AppTheme.grey7Color,
                                                ),
                                              ),
                                              SizedBox(height: 16.h),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(
                                                    AppTheme.whiteColor,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _searchController.clear();
                                                  _clinicsCubit?.searchClinics('');
                                                },
                                                child: Text(
                                                  context.tr.translate("show_all_clinics"),
                                                  style: TextStyles.nexaRegular.copyWith(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: themeProvider.currentThemeData!.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: GridView.builder(
                                          itemCount: state.clinicsResponse.clinics.length,
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 0.75,
                                          ),
                                          itemBuilder: (context, index) {
                                            var clinic = state.clinicsResponse.clinics[index];
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  AppRoutes.clinicDoctors,
                                                  arguments: clinic,
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
                            )
                      : SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
