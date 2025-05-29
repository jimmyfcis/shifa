import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../cubit/departments_cubit.dart';
import '../cubit/departments_state.dart';
import '../widgets/department_card.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({super.key});

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      alignment: Alignment.bottomCenter,
      height: 105,
      hasBorderRadius: false,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      appBarChild: CommonAppBarTitle(
        title: context.tr.translate('departments'),
      ),
      contentChild: Expanded(
        child: BlocProvider(
          create: (context) => sl<DepartmentsCubit>()..getAllDepartments(),
          child: BlocConsumer<DepartmentsCubit, DepartmentsState>(
            listener: (context, state) {
              if (state is DepartmentsError) {
                showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
              }
            },
            builder: (context, state) {
              return state is DepartmentsLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: themeProvider.currentThemeData!.primaryColor,
                    ))
                  : state is DepartmentsLoaded
                      ? ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.response.departments?.length ?? 0,
                          itemBuilder: (context, index) {
                            final department = state.response.departments![index];
                            return DepartmentCard(department: department);
                          },
                        )
                      : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
