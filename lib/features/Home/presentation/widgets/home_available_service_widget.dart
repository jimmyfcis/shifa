import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/features/Bottom%20Bar/cubit/bottom_bar_cubit.dart';

import 'home_service_card.dart';

class HomeAvailableService extends StatelessWidget {
  const HomeAvailableService({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Services",
          style: TextStyles.nexaBold.copyWith(
            fontSize: 16.sp,
            color: AppTheme.primaryTextColor,
          ),
        ),
        SizedBox(height: 16.h),
        themeProvider.currentTheme == ThemeEnum.shifa
            ? SizedBox(
                height: 115.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  itemCount: AppConstants().shifaServiceModel.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HomeServiceCard(
                      onTap: () {
                        log("title: ${AppConstants().shifaServiceModel[index].title}");
                        if (AppConstants().shifaServiceModel[index].title ==
                            "Ambulance") {
                          Navigator.pushNamed(context, AppRoutes.ambulance);
                        } else if (AppConstants()
                                .shifaServiceModel[index]
                                .title ==
                            "Discover Clinic") {
                          BlocProvider.of<BottomBarCubit>(context)
                              .updateIndex(2);
                        } else if (AppConstants()
                                .shifaServiceModel[index]
                                .title ==
                            "Monitor Queue") {
                          Navigator.pushNamed(
                              context, AppRoutes.firstQueueScreen);
                        } else if (AppConstants()
                                .shifaServiceModel[index]
                                .title ==
                            "Physical Therapy") {
                          Navigator.pushNamed(context, AppRoutes.clinicDoctors,
                              arguments: "Physical Therapy");
                        }
                      },
                      title: AppConstants().shifaServiceModel[index].title,
                      icon: AppConstants().shifaServiceModel[index].icon,
                    );
                  },
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: AppConstants().leksellServiceModel.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomeServiceCard(
                    onTap: () {
                      log("title: ${AppConstants().leksellServiceModel[index].title}");
                      if (AppConstants().leksellServiceModel[index].title ==
                          "Ambulance") {
                        Navigator.pushNamed(context, AppRoutes.ambulance);
                      } else if (AppConstants()
                              .leksellServiceModel[index]
                              .title ==
                          "Clinics") {
                        BlocProvider.of<BottomBarCubit>(context).updateIndex(2);
                      } else if (AppConstants()
                              .leksellServiceModel[index]
                              .title ==
                          "Queue") {
                        Navigator.pushNamed(
                            context, AppRoutes.firstQueueScreen);
                      } else {
                        Navigator.pushNamed(context, AppRoutes.clinicDoctors,
                            arguments: AppConstants()
                                .leksellServiceModel[index]
                                .title);
                      }
                    },
                    title: AppConstants().leksellServiceModel[index].title,
                    icon: AppConstants().leksellServiceModel[index].icon,
                  );
                },
              ),
      ],
    );
  }
}
