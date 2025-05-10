import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/presentation/cubit/appointment_cubit.dart';
import 'package:shifa/features/Booking/presentation/cubit/appointment_state.dart';
import 'package:shifa/features/Booking/widgets/appointment_list_view.dart';

import '../../../core/network/injection_container.dart';
import '../../../core/widgtes/custom_snackbar.dart';

class AppointmentBody extends StatefulWidget {
  const AppointmentBody({super.key});

  @override
  State<AppointmentBody> createState() => _AppointmentBodyState();
}

class _AppointmentBodyState extends State<AppointmentBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late AppointmentCubit _appointmentCubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    
    _appointmentCubit = sl<AppointmentCubit>();
    _appointmentCubit.getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider.value(
      value: _appointmentCubit,
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentFailure) {
            showCustomSnackBar(context, state.message, isError: true,statusCode: state.statusCode);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 50.h,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.billColor
                      : AppTheme.secondaryColorLeksell,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: themeProvider.currentThemeData!.primaryColor,
                  ),
                  unselectedLabelColor: AppTheme.textBlackColor,
                  tabs: [
                    Tab(
                      child: Text(
                        "Upcoming",
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 14.sp,
                          color: _selectedIndex == 0
                              ? Colors.white
                              : AppTheme.textBlackColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Past",
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 14.sp,
                          color: _selectedIndex == 1
                              ? Colors.white
                              : AppTheme.textBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAppointmentList(state),
                    _buildAppointmentList(state),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppointmentList(AppointmentState state) {
    if (state is AppointmentLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is AppointmentSuccess) {
      if (state.response.appointments.isEmpty) {
        return const Center(child: Text('No appointments found'));
      }
      return AppointmentListView(
        tabSelectedIndex: _selectedIndex,
        appointments: state.response.appointments,
      );
    }
    return const SizedBox();
  }

  @override
  void dispose() {
    _appointmentCubit.close();
    _tabController.dispose();
    super.dispose();
  }
}
