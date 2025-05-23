import 'package:shifa/features/Booking/data/models/reschedule_appointment_model.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';

class RescheduleAppointmentUseCase {
  final AppointmentRepository repository;

  RescheduleAppointmentUseCase({required this.repository});

  Future<RescheduleAppointmentResponse> call(RescheduleAppointmentRequest request) async {
    return await repository.rescheduleAppointment(request);
  }
} 