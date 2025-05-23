import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';

class CancelAppointmentUseCase {
  final AppointmentRepository repository;

  CancelAppointmentUseCase({required this.repository});

  Future<CancelAppointmentResponse> call(CancelAppointmentRequest request) async {
    return await repository.cancelAppointment(request);
  }
} 