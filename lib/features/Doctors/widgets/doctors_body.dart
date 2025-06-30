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
import 'package:shifa/features/Doctors/presentation/search_doctors/search_doctor_cubit.dart';
import 'package:shifa/features/Doctors/presentation/search_doctors/search_doctor_state.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/theme/styles.dart';
import 'doctor_item.dart';

class DoctorsBody extends StatefulWidget {
  const DoctorsBody({super.key});

  @override
  State<DoctorsBody> createState() => _DoctorsBodyState();
}

class _DoctorsBodyState extends State<DoctorsBody> {
  final TextEditingController _searchController = TextEditingController();
  SearchDoctorCubit? _searchDoctorCubit;

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
            final cubit = sl<SearchDoctorCubit>();
            _searchDoctorCubit = cubit;
            cubit.getAllDoctors(
              keyword: "",
            ); // Call the method immediately after creating the cubit
            return cubit;
          },
          child: BlocBuilder<SearchDoctorCubit, SearchDoctorState>(
            builder: (context, state) {
              return state is SearchDoctorLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: themeProvider.currentThemeData!.primaryColor,
                      ),
                    )
                  : state is SearchDoctorLoaded
                      ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  controller: _searchController,
                                  name: "clinic",
                                  hasName: false,
                                  labelText: context.tr.translate("search_doctor"),
                                  hintText: context.tr.translate("search_doctor"),
                                  onChanged: (value) {
                                    // Call the search method in the cubit
                                    _searchDoctorCubit?.searchDoctors(value ?? '');
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
                                      _searchDoctorCubit?.searchDoctors('');
                                    },
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                state.searchDoctorsResponse.doctors==null || state.searchDoctorsResponse.doctors!.isEmpty
                                    ? Expanded(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                context.tr.translate("no_doctors_found"),
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
                                                  _searchDoctorCubit?.searchDoctors('');
                                                },
                                                child: Text(
                                                  context.tr.translate("show_all_doctors"),
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
                                        child: ListView.builder(
                                          itemCount: state.searchDoctorsResponse.doctors?.length??0,
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          itemBuilder: (context, index) {
                                            var doctor = state.searchDoctorsResponse.doctors![index];
                                            final locale = Localizations.localeOf(context);
                                            final isArabic = locale.languageCode == 'ar';
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  AppRoutes.doctorProfile,
                                                  arguments: doctor,
                                                );
                                              },
                                              child: DoctorItem(
                                                doctor: doctor, isArabic: isArabic, themeProvider: themeProvider,
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
