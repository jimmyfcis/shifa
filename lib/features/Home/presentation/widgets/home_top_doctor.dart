import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shifa/features/Home/presentation/cubit/home_state.dart';
import '../../../../core/network/injection_container.dart';
import 'Top_Doctor_Item.dart';

class HomeTopDoctor extends StatefulWidget {
  const HomeTopDoctor({super.key});

  @override
  State<HomeTopDoctor> createState() => _HomeTopDoctorState();
}

class _HomeTopDoctorState extends State<HomeTopDoctor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) {
        final cubit = sl<HomeCubit>();
        cubit.fetchTopDoctors(); // Call the method immediately after creating the cubit
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final locale = Localizations.localeOf(context);
          final isArabic = locale.languageCode == 'ar';
          return state is HomeLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: themeProvider.currentThemeData!.primaryColor,
                ))
              : state is HomeLoaded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(context.tr.translate("top_doctor"),
                              style: TextStyles.nexaBold.copyWith(
                                fontSize: 16.sp,
                                color: AppTheme.textBlackColor,
                              )),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 235.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.topDoctorsResponse.doctors?.length ?? 0,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 16.w,
                            ),
                            itemBuilder: (context, index) {
                              final doctor = state.topDoctorsResponse.doctors![index];
                              return TopDoctorItem(doctor: doctor, themeProvider: themeProvider, isArabic: isArabic);
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
        },
      ),
    );
  }
}
