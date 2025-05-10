import 'package:shifa/features/Booking/data/models/appointment_model.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final AppointmentResponse response;

  AppointmentSuccess(this.response);
}

class AppointmentFailure extends AppointmentState {
  final String message;
  final int statusCode;

  AppointmentFailure(this.message, this.statusCode);
} 