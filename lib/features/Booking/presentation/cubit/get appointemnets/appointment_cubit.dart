import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Booking/domain/usecases/get_appointments_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/get%20appointemnets/appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final GetAppointmentsUseCase getAppointmentsUseCase;

  AppointmentCubit({required this.getAppointmentsUseCase}) : super(AppointmentInitial());

  Future<void> getAppointments() async {
    emit(AppointmentLoading());
    try {
      final response = await getAppointmentsUseCase();
      emit(AppointmentSuccess(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(AppointmentFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 