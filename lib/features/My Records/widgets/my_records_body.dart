import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/My%20Records/presentation/managers/records/records_cubit.dart';
import 'package:shifa/features/My%20Records/widgets/report_card.dart';
import 'package:shifa/features/My%20Records/widgets/record_single_item.dart';
import 'package:shifa/features/My%20Records/widgets/records_item.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/widgtes/error_widget.dart';
import '../../../core/widgtes/no_record_widget.dart';
import '../data/models/records_response_model.dart';
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
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => sl<RecordsCubit>()..getMyRecords(visitNumber: widget.visit.visitNumber.toString()),
            child: BlocBuilder<RecordsCubit, RecordsState>(
              builder: (context, state) {
                if (state is RecordsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecordsFailure) {
                  return CustomErrorWidget(
                    error: state.message,
                    onRetry: () =>
                        context.read<RecordsCubit>().getMyRecords(visitNumber: widget.visit.visitNumber.toString()),
                  );
                } else if (state is RecordsLoaded) {
                  if (state.recordsResponseModel.rads!.isEmpty &&
                      state.recordsResponseModel.labs!.isEmpty &&
                      state.recordsResponseModel.medicalReports!.isEmpty &&
                      state.recordsResponseModel.patientHistory!.isEmpty &&
                      state.recordsResponseModel.pateintFindings!.isEmpty &&
                      state.recordsResponseModel.diagnosis!.isEmpty &&
                      state.recordsResponseModel.patientVitalSigns!.isEmpty &&
                      state.recordsResponseModel.complaints!.isEmpty) {
                    return Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
                      child: NoRecordWidget(
                        icon: themeProvider.currentTheme == ThemeEnum.leksell
                            ? SVGAssets.clincsLeksellIcon
                            : SVGAssets.clincsShifaIcon,
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.recordsResponseModel.diagnosis!.isNotEmpty) ...[
                          Text(
                            context.tr.translate("diagnosis"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          for (Diagnosis diagnose in state.recordsResponseModel.diagnosis ?? [])
                            RecordSingleItem(
                              themeProvider: themeProvider,
                              title: diagnose.desc ?? "",
                              date: diagnose.date,
                            ),
                        ],
                        if (state.recordsResponseModel.complaints!.isNotEmpty) ...[
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                              context.tr.translate("complaints"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          for (Complaint complaint in state.recordsResponseModel.complaints ?? [])
                            RecordSingleItem(
                              themeProvider: themeProvider,
                              title: complaint.desc ?? "",
                              date: complaint.date,
                            ),
                        ],

                        if (state.recordsResponseModel.patientHistory!.isNotEmpty) ...[
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                              context.tr.translate("patient_history"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          for (PatientHistory patientHistory in state.recordsResponseModel.patientHistory ?? [])
                            RecordSingleItem(
                              themeProvider: themeProvider,
                              title: patientHistory.name ?? "",
                              date: patientHistory.date,
                            ),
                        ],
                        if (state.recordsResponseModel.patientVitalSigns!.isNotEmpty) ...[
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            context.tr.translate("patient_vital"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          for (PatientVitalSign patientVitalSign in state.recordsResponseModel.patientVitalSigns ?? [])
                            RecordSingleItem(
                              themeProvider: themeProvider,
                              title: "${isArabic?patientVitalSign.nameAr ?? "":patientVitalSign.nameEn ?? ""} ${patientVitalSign.details?.value!=null?"--- ${patientVitalSign.details?.value.toString()}":""} ",
                              date: patientVitalSign.details?.date??"",
                            ),
                        ],
                        if (state.recordsResponseModel.pateintFindings!.isNotEmpty) ...[
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                              context.tr.translate("patient_findings"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          for (PatientFinding patientFinding in state.recordsResponseModel.pateintFindings ?? [])
                            RecordSingleItem(
                              themeProvider: themeProvider,
                              title: patientFinding.descEn ?? "",
                              date: patientFinding.date,
                            ),
                        ],
                        if (state.recordsResponseModel.medicalReports!.isNotEmpty) ...[
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                              context.tr.translate("reports"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          for (var report in state.recordsResponseModel.medicalReports ?? [])
                            ReportCard(medicalReport: report),
                        ],
                        if (state.recordsResponseModel.labs!.isNotEmpty) ...[
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                              context.tr.translate("lab_tests"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          for (var lab in state.recordsResponseModel.labs ?? [])
                            RecordsItem(
                              icon: themeProvider.currentTheme == ThemeEnum.leksell
                                  ? SVGAssets.labsLeksellIcon
                                  : SVGAssets.labShifaIcon,
                              labRecord: lab,
                            ),
                        ],
                        if (state.recordsResponseModel.rads!.isNotEmpty) ...[
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                              context.tr.translate("radiology"),
                            style: TextStyles.nexaBold.copyWith(
                              fontSize: 16.sp,
                              color: AppTheme.primaryTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          for (var rad in state.recordsResponseModel.rads ?? [])
                            RecordsItem(
                              icon: SVGAssets.radiologyIcon,
                              radRecord: rad,
                            ),
                          SizedBox(
                            height: 32.h,
                          ),
                        ],
                      ],
                    );
                  }
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
