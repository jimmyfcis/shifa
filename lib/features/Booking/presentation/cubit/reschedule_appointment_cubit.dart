import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Booking/data/models/reschedule_appointment_model.dart';
import 'package:shifa/features/Booking/domain/usecases/reschedule_appointment_usecase.dart';

import '../../../../core/error/error_handler.dart';

part 'reschedule_appointment_state.dart';

class RescheduleAppointmentCubit extends Cubit<RescheduleAppointmentState> {
  final RescheduleAppointmentUseCase rescheduleAppointmentUseCase;

  RescheduleAppointmentCubit({
    required this.rescheduleAppointmentUseCase,
  }) : super(RescheduleAppointmentInitial());

  Future<void> rescheduleAppointment({
    required RescheduleAppointmentRequest rescheduleAppointmentRequest,
  }) async {
    emit(RescheduleAppointmentLoading());

    try {
      final response = await rescheduleAppointmentUseCase(rescheduleAppointmentRequest);
      emit(RescheduleAppointmentSuccess(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(RescheduleAppointmentError(failure.message, failure.statusCode ?? 0));
    }
  }
} 