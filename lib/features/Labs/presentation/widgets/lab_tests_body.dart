import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/features/Labs/presentation/lab_cubit.dart';
import 'package:shifa/features/Labs/presentation/lab_state.dart';
import 'package:shifa/features/Labs/presentation/widgets/record_lab_card.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/widgtes/error_widget.dart';

class LabTestsBody extends StatelessWidget {
  const LabTestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: BlocProvider(
        create: (context) => sl<LabCubit>()..getLabs(),
        child: BlocBuilder<LabCubit, LabState>(
          builder: (context, state) {
            if (state is LabLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LabLoaded) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: state.labResponse.labs.isEmpty
                    ? NoRecordWidget(
                        icon: themeProvider.currentTheme == ThemeEnum.shifa
                            ? SVGAssets.labShifaIcon
                            : SVGAssets.labsLeksellIcon,
                      )
                    : ListView.separated(
                        itemCount: state.labResponse.labs.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                        itemBuilder: (context, index) {
                          return LabRecordCard(
                            lab: state.labResponse.labs[index],
                          );
                        },
                      ),
              );
            } else if (state is LabFailure) {
              return CustomErrorWidget(error: state.message, onRetry: () => context.read<LabCubit>().getLabs());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
