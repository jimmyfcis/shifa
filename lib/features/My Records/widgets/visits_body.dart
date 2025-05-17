import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shifa/core/network/injection_container.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/widgtes/empty_state.dart';
import 'package:shifa/core/widgtes/error_widget.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/theme.dart';
import '../data/models/visit_model.dart';
import '../presentation/visit_cubit.dart';
import '../presentation/visit_state.dart';

class VisitsBody extends StatelessWidget {
  const VisitsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => sl<VisitCubit>()..getMyVisits(),
        child: BlocBuilder<VisitCubit, VisitState>(
          builder: (context, state) {
            if (state is VisitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VisitLoaded) {
              if (state.visitResponse.visits.isEmpty) {
                return const EmptyStateWidget(
                  message: 'No visits found',
                );
              }
              return _buildVisitsList(context, state.visitResponse.visits);
            } else if (state is VisitFailure) {
              return CustomErrorWidget(
                error: state.message,
                onRetry: () => context.read<VisitCubit>().getMyVisits(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildVisitsList(BuildContext context, List<Visit> visits) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0.r),
      itemCount: visits.length,
      itemBuilder: (context, index) {
        final visit = visits[index];
        return _buildVisitCard(context, visit);
      },
    );
  }

  Widget _buildVisitCard(BuildContext context, Visit visit) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';

    String? visitType = isArabic ? visit.visitTypeAr : visit.visitTypeEn;
    String? placeName = isArabic ? visit.placeNameAr : visit.placeNameEn;
    String? doctorName = isArabic ? visit.doctorNameAr : visit.doctorNameEn;
    String? doctorSpecialty = isArabic ? visit.doctorSpecialtyAr : visit.doctorSpecialtyEn;

    // Format the date if not null
    String formattedStartDate = '';
    if (visit.visitStartdate != null) {
      try {
        final dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
        final date = dateFormat.parse(visit.visitStartdate!);
        formattedStartDate = DateFormat('dd MMM yyyy, HH:mm').format(date);
      } catch (e) {
        formattedStartDate = visit.visitStartdate ?? '';
      }
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.myRecords,
          arguments: {
            "visit": visit,
          },
        );
      },
      child: Card(
        color: AppTheme.whiteColor,
        margin: EdgeInsets.only(bottom: 12.r),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      placeName ?? '',
                      style: TextStyles.nexaBold.copyWith(
                        color: AppTheme.shifaPrimaryColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '#${visit.visitNumber ?? ''}',
                      style: TextStyles.nexaRegular.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                formattedStartDate,
                style: TextStyles.nexaRegular.copyWith(
                  color: Colors.grey[700],
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Type: $visitType',
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppTheme.primaryTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Doctor: $doctorName',
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppTheme.primaryTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Specialty: $doctorSpecialty',
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppTheme.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
