import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/presentation/managers/records/records_cubit.dart';
import 'package:shifa/features/My%20Records/widgets/diagnose_card.dart';
import 'package:shifa/features/My%20Records/widgets/medicines_card.dart';
import 'package:shifa/features/My%20Records/widgets/records_item.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/widgtes/error_widget.dart';
import '../data/models/visit_model.dart';
import '../presentation/managers/records/records_state.dart';

class MyRecordsBody extends StatefulWidget {
  final Visit visit;

  const MyRecordsBody({super.key, required this.visit});

  @override
  State<MyRecordsBody> createState() => _MyRecordsBodyState();
}

class _MyRecordsBodyState extends State<MyRecordsBody> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
            sl<RecordsCubit>()
              ..getMyRecords(visitNumber: widget.visit.visitNumber.toString()),
            child: BlocBuilder<RecordsCubit, RecordsState>(
              builder: (context, state) {
                if(state is RecordsLoading)
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                else if (state is RecordsFailure) {
                  return CustomErrorWidget(
                    error: state.message,
                    onRetry: () => context.read<RecordsCubit>().getMyRecords(visitNumber: widget.visit.visitNumber.toString()),
                  );
                }
                else if(state is RecordsLoaded) {
                  // NoRecordWidget(
                  //   icon: themeProvider.currentTheme == ThemeEnum.leksell
                  //       ? SVGAssets.clincsLeksellIcon
                  //       : SVGAssets.clincsShifaIcon,
                  // )
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMM, yyyy').format(
                          DateFormat('dd MMM, yyyy').parse(
                            "21 Oct, 2024",
                          ),
                        ),
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppTheme.greyColor, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  themeProvider.currentTheme == ThemeEnum.leksell
                                      ? SVGAssets.clincsLeksellIcon
                                      : SVGAssets.clincsShifaIcon,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "Examination",
                                  style: TextStyles.nexaBold.copyWith(
                                    fontSize: 14.sp,
                                    color: AppTheme.primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  SVGAssets.bookingIcon,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "21 Oct, 2024",
                                  style: TextStyles.nexaRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppTheme.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  SVGAssets.stethoscopeIcon,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "Dr.Fady Mohamed Nabil",
                                  style: TextStyles.nexaRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: AppTheme.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        DateFormat('MMM, yyyy').format(
                          DateFormat('dd MMM, yyyy').parse(
                            "21 Oct, 2024",
                          ),
                        ),
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const DiagnoseCard(),
                      SizedBox(
                        height: 16.h,
                      ),
                      const MedicinesCard(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Lab Tests",
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      for(var lab in state.recordsResponseModel.labs??[])
                      RecordsItem(
                        icon: themeProvider.currentTheme == ThemeEnum.leksell
                            ? SVGAssets.labsLeksellIcon
                            : SVGAssets.labShifaIcon, labRecord: lab,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Radiology",
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      for(var rad in state.recordsResponseModel.rads??[])
                        RecordsItem(
                          icon:  SVGAssets.radiologyIcon, radRecord: rad,
                        ),
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
