import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Booking/data/models/book_appointment_model.dart';
import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';

abstract class AppointmentRepository {
  Future<AppointmentResponse> getAppointments();
  Future<BookAppointmentResponse> bookAppointment(BookAppointmentRequest request);
  Future<CancelAppointmentResponse> cancelAppointment(CancelAppointmentRequest request);
} 