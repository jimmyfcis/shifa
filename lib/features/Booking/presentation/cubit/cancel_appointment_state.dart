part of 'cancel_appointment_cubit.dart';

abstract class CancelAppointmentState {}

class CancelAppointmentInitial extends CancelAppointmentState {}

class CancelAppointmentLoading extends CancelAppointmentState {}

class CancelAppointmentSuccess extends CancelAppointmentState {
  final CancelAppointmentResponse response;

  CancelAppointmentSuccess(this.response);
}

class CancelAppointmentError extends CancelAppointmentState {
  final String message;
  final int statusCode;

  CancelAppointmentError(this.message, this.statusCode);
}