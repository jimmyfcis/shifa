import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Booking/data/models/book_appointment_model.dart';
import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';

import '../../../../core/network/dio_client.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentResponse> getAppointments();
  Future<BookAppointmentResponse> bookAppointment(BookAppointmentRequest request);
  Future<CancelAppointmentResponse> cancelAppointment(CancelAppointmentRequest request);
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<AppointmentResponse> getAppointments() async {
    final response = await dio.get(ApiEndpoints.appointments);
    return AppointmentResponse.fromJson(response.data);
  }

  @override
  Future<BookAppointmentResponse> bookAppointment(BookAppointmentRequest request) async {
    final response = await dio.post(
      ApiEndpoints.bookAppointment,
      data: request.toJson(),
    );
    return BookAppointmentResponse.fromJson(response.data);
  }

  @override
  Future<CancelAppointmentResponse> cancelAppointment(CancelAppointmentRequest request) async {
    final response = await dio.post(
      ApiEndpoints.cancelAppointment,
      data: request.toJson(),
    );
    return CancelAppointmentResponse.fromJson(response.data);
  }
}
