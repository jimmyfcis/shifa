import 'package:shifa/features/Booking/data/datasources/appointment_remote_data_source.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppointmentResponse> getAppointments() async {
    return await remoteDataSource.getAppointments();
  }
} 