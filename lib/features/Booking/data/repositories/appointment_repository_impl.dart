import 'package:shifa/features/Booking/data/datasources/appointment_remote_data_source.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Booking/data/models/book_appointment_model.dart';
import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppointmentResponse> getAppointments() async {
    return await remoteDataSource.getAppointments();
  }

  @override
  Future<BookAppointmentResponse> bookAppointment(BookAppointmentRequest request) async {
    return await remoteDataSource.bookAppointment(request);
  }

  @override
  Future<CancelAppointmentResponse> cancelAppointment(CancelAppointmentRequest request) async {
    return await remoteDataSource.cancelAppointment(request);
  }
} 