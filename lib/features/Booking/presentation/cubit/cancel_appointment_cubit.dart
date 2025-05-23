import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';
import 'package:shifa/features/Booking/domain/usecases/cancel_appointment_usecase.dart';

import '../../../../core/error/error_handler.dart';

part 'cancel_appointment_state.dart';

class CancelAppointmentCubit extends Cubit<CancelAppointmentState> {
  final CancelAppointmentUseCase cancelAppointmentUseCase;

  CancelAppointmentCubit({required this.cancelAppointmentUseCase}) : super(CancelAppointmentInitial());

  Future<void> cancelAppointment({required CancelAppointmentRequest cancelAppointmentRequest}) async {
    emit(CancelAppointmentLoading());
    try {
      final response = await cancelAppointmentUseCase(cancelAppointmentRequest);
      emit(CancelAppointmentSuccess(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(CancelAppointmentError(failure.message, failure.statusCode ?? 0));
    }
  }
} 