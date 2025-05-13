import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/features/Radiology/presentation/radiology_cubit.dart';
import 'package:shifa/features/Radiology/presentation/radiology_state.dart';
import 'package:shifa/features/Radiology/widgets/RadioRecordCard.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/widgtes/empty_state.dart';
import '../../../core/widgtes/error_widget.dart';

class RadiologyBody extends StatefulWidget {
  const RadiologyBody({super.key});

  @override
  State<RadiologyBody> createState() => _RadiologyBodyState();
}

class _RadiologyBodyState extends State<RadiologyBody> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => sl<RadiologyCubit>()..getRadiologies(),
        child: BlocBuilder<RadiologyCubit, RadiologyState>(
          builder: (context, state) {
            if (state is RadiologyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RadiologyLoaded) {
              if (state.radiologyResponse.radiologies.isEmpty) {
                return const EmptyStateWidget(
                  message: 'No radiologies found',
                );
              }
              return Padding(
                padding: const EdgeInsets.all(24),
                child: AppConstants().recordsList.isEmpty
                    ? const NoRecordWidget(
                        icon: SVGAssets.radiologyIcon,
                      )
                    : ListView.separated(
                        itemCount: state.radiologyResponse.radiologies.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                        itemBuilder: (context, index) {
                          return RadioRecordCard(
                            radiology: state.radiologyResponse.radiologies[index],

                          );
                        },
                      ),
              );
            } else if (state is RadiologyFailure) {
              return CustomErrorWidget(
                  error: state.message, onRetry: () => context.read<RadiologyCubit>().getRadiologies());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
