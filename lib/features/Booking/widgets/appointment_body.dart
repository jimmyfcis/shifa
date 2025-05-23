import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/presentation/cubit/get%20appointemnets/appointment_cubit.dart';
import 'package:shifa/features/Booking/presentation/cubit/get%20appointemnets/appointment_state.dart';
import 'package:shifa/features/Booking/widgets/appointment_list_view.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/widgtes/custom_snackbar.dart';
import 'appointmet_upcoming_list.dart';

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
          return  state is AppointmentLoading? const Center(child: CircularProgressIndicator()):state is AppointmentSuccess? Column(
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
                context.tr.translate("upcoming"),
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
                        context.tr.translate("past"),
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
                    UpcomingAppointmentsListView(
                      appointments: state.response.appointments.where((appointment){
                        if(appointment.date==null) return false;
                        final appointmentDate=DateTime.parse(appointment.date!);
                        return appointmentDate.isBefore(DateTime.now());
                      }).toList(),
                    ),
                    PastAppointmentsListView(
                      appointments: state.response.appointments.where((appointment){
                        if(appointment.date==null) return false;
                        final appointmentDate=DateTime.parse(appointment.date!);
                        return appointmentDate.isBefore(DateTime.now());
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ):SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    _appointmentCubit.close();
    _tabController.dispose();
    super.dispose();
  }
}
