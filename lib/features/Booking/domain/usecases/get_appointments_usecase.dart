import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';

class GetAppointmentsUseCase {
  final AppointmentRepository repository;

  GetAppointmentsUseCase({required this.repository});

  Future<AppointmentResponse> call() async {
    return await repository.getAppointments();
  }
} 