import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/network/injection_container.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_snackbar.dart';
import 'package:shifa/features/Labs/data/models/lab_model.dart';
import 'package:shifa/features/Records%20Detail/presntation/managers/file_cubit.dart';
import 'package:shifa/features/Records%20Detail/presntation/managers/file_state.dart';

class LabRecordCard extends StatefulWidget {
  final Lab lab;

  const LabRecordCard({
    super.key,
    required this.lab,
  });

  @override
  State<LabRecordCard> createState() => _LabRecordCardState();
}

class _LabRecordCardState extends State<LabRecordCard> {
  final FileCubit _fileCubit = sl<FileCubit>();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return BlocProvider.value(
      value: _fileCubit,
      child: BlocConsumer<FileCubit, FileState>(
        listener: (context, state) {
          if (state is FileError) {
            showCustomSnackBar(context, context.tr.translate("no_file"), isError: true, statusCode: state.statusCode);
          }
          if (state is FileLoaded) {
            if (state.response.base64 != null && state.response.base64!.isNotEmpty) {
              Navigator.pushNamed(
                context,
                AppRoutes.recordsDetails,
                arguments: {
                  "file": state.response.base64 ?? "",
                  "isLab": true,
                },
              );
            } else {
              showCustomSnackBar(context, context.tr.translate("no_file"), isError: true);
            }
          }
        },
        builder: (context, state) {
          return state is FileLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: themeProvider.currentThemeData!.primaryColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("MMM, yyyy")
                          .format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.startDate ?? "")),
                      style: TextStyles.nexaBold.copyWith(
                        fontSize: 16.sp,
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        _fileCubit.getFileDetails(isLab: true, fileIdentifier: widget.lab.patFinAccount?.toString() ?? "");
                      },
                      child: Container(
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
                                  themeProvider.currentTheme == ThemeEnum.shifa
                                      ? SVGAssets.labShifaIcon
                                      : SVGAssets.labsLeksellIcon,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  context.tr.translate("lab_tests"),
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
                                  "${DateFormat("dd MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.startDate ?? ""))} To ${DateFormat("dd MMM, yyyy").format(DateFormat("dd/MM/yyyy HH:mm:ss").parse(widget.lab.endDate ?? ""))}",
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
                                  isArabic ? widget.lab.doctorNameAr ?? "" : widget.lab.doctorNameEn ?? "",
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
                    ),
                  ],
                );
        },
      ),
    );
  }
}
