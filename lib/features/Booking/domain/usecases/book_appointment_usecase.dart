import 'package:shifa/features/Booking/data/models/book_appointment_model.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';

class BookAppointmentUseCase {
  final AppointmentRepository repository;

  BookAppointmentUseCase({required this.repository});

  Future<BookAppointmentResponse> call(BookAppointmentRequest request) async {
    return await repository.bookAppointment(request);
  }
} 