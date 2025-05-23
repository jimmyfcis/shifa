part of 'reschedule_appointment_cubit.dart';

abstract class RescheduleAppointmentState {}

class RescheduleAppointmentInitial extends RescheduleAppointmentState {}

class RescheduleAppointmentLoading extends RescheduleAppointmentState {}

class RescheduleAppointmentSuccess extends RescheduleAppointmentState {
  final RescheduleAppointmentResponse response;

  RescheduleAppointmentSuccess(this.response);
}

class RescheduleAppointmentError extends RescheduleAppointmentState {
  final String message;
  final int statusCode;

  RescheduleAppointmentError(this.message, this.statusCode);
} 