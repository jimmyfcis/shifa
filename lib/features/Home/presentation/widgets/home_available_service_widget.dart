import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import '../../../../core/assets/svg/svg_assets.dart';
import '../../../../core/models/service_model.dart';
import 'home_service_card.dart';

class HomeAvailableService extends StatelessWidget {
  const HomeAvailableService({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    List<ServiceModel> shifaServiceModel = [
      ServiceModel(title: context.tr.translate("discover_clinic"), icon: SVGAssets.clincsShifaIcon),
      ServiceModel(title: context.tr.translate("monitor_queue"), icon: SVGAssets.monitorQueueShifaIcon),
      ServiceModel(
          title: context.tr.translate("departments"), icon: SVGAssets.physicalTherapyShifaIcon),
      ServiceModel(title: context.tr.translate("ambulance"), icon: SVGAssets.ambulanceShifa),
    ];
    List<ServiceModel> leksellServiceModel = [
      ServiceModel(title: context.tr.translate("discover_clinic"), icon: SVGAssets.clincsLeksellIcon),
      ServiceModel(title: context.tr.translate("monitor_queue"), icon: SVGAssets.queueLeksell),
      ServiceModel(title: context.tr.translate("ambulance"), icon: SVGAssets.ambulanceLeksell),
      ServiceModel(title: context.tr.translate("departments"), icon: SVGAssets.radioTherapyLeksell),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.translate("available_services"),
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
                  itemCount: shifaServiceModel.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HomeServiceCard(
                      onTap: () {
                        log("title: ${shifaServiceModel[index].title}");
                        if (shifaServiceModel[index].title ==
                            context.tr.translate("ambulance")) {
                          Navigator.pushNamed(context, AppRoutes.ambulance);
                        } else if (shifaServiceModel[index]
                                .title ==
                            context.tr.translate("discover_clinic")) {
                          Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                            "index": 2,
                          });
                        } else if (shifaServiceModel[index]
                                .title ==
                            context.tr.translate("monitor_queue")) {
                          Navigator.pushNamed(
                              context, AppRoutes.firstQueueScreen);
                        } else if (shifaServiceModel[index]
                                .title ==
                            context.tr.translate("departments")) {
                          Navigator.pushNamed(
                              context, AppRoutes.departments);
                        }
                      },
                      title: shifaServiceModel[index].title,
                      icon: shifaServiceModel[index].icon,
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
                itemCount: leksellServiceModel.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomeServiceCard(
                    onTap: () {
                      log("title: ${leksellServiceModel[index].title}");
                      if (leksellServiceModel[index].title ==
                          context.tr.translate("ambulance")) {
                        Navigator.pushNamed(context, AppRoutes.ambulance);
                      } else if (leksellServiceModel[index]
                              .title ==
                          context.tr.translate("discover_clinic")) {
                        Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                          "index": 2,
                        });
                      } else if (leksellServiceModel[index]
                              .title ==
                          context.tr.translate("monitor_queue")) {
                        Navigator.pushNamed(
                            context, AppRoutes.firstQueueScreen);
                      }
                      else if (leksellServiceModel[index]
                          .title ==
                          context.tr.translate("departments")) {
                        Navigator.pushNamed(
                            context, AppRoutes.departments);
                      }
                    },
                    title: leksellServiceModel[index].title,
                    icon: leksellServiceModel[index].icon,
                  );
                },
              ),
      ],
    );
  }
}
