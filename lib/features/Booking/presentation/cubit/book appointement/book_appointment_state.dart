import 'package:shifa/features/Booking/data/models/book_appointment_model.dart';

abstract class BookAppointmentState {}

class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentSuccess extends BookAppointmentState {
  final BookAppointmentResponse response;

  BookAppointmentSuccess(this.response);
}

class BookAppointmentFailure extends BookAppointmentState {
  final String message;
  final int statusCode;

  BookAppointmentFailure(this.message, this.statusCode);
} 