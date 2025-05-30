import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/doctor_card.dart';

import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../Booking/presentation/cubit/get appointemnets/appointment_cubit.dart';
import '../../../Booking/presentation/cubit/get appointemnets/appointment_state.dart';

class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({super.key});

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  late AppointmentCubit _appointmentCubit;

  @override
  void initState() {
    super.initState();
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
            showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
          }
        },
        builder: (context, state) {
          return state is AppointmentLoading
              ? const Center(child: CircularProgressIndicator())
              : state is AppointmentSuccess &&
                      state.response.appointments
                          .where((appointment) {
                            if (appointment.date == null) return false;
                            final appointmentDate = DateTime.parse(appointment.date!);
                            return appointmentDate.isAfter(DateTime.now());
                          })
                          .toList()
                          .isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.tr.translate("upcoming"),
                                style: TextStyles.nexaBold.copyWith(
                                  fontSize: 16.sp,
                                  color: AppTheme.textBlackColor,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                                    "index": 1,
                                  });
                                },
                                child: Text(
                                  context.tr.translate("see_all"),
                                  style: TextStyles.nexaRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: themeProvider.currentTheme == ThemeEnum.shifa
                                        ? AppTheme.green5Color
                                        : AppTheme.leksellPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 145.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.response.appointments
                                .where((appointment) {
                                  if (appointment.date == null) return false;
                                  final appointmentDate = DateTime.parse(appointment.date!);
                                  return appointmentDate.isAfter(DateTime.now());
                                })
                                .toList()
                                .length,
                            itemBuilder: (context, index) => DoctorCard(
                              appointment: state.response.appointments.where((appointment) {
                                if (appointment.date == null) return false;
                                final appointmentDate = DateTime.parse(appointment.date!);
                                return appointmentDate.isAfter(DateTime.now());
                              }).toList()[index],
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
        },
      ),
    );
  }
}
