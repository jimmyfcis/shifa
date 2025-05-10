import 'package:shifa/features/Booking/data/models/appointment_model.dart';

abstract class AppointmentRepository {
  Future<AppointmentResponse> getAppointments();
} 