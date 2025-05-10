import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';

import '../../../../core/network/dio_client.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentResponse> getAppointments();
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<AppointmentResponse> getAppointments() async {
    final response = await dio.get(ApiEndpoints.appointments);
    return AppointmentResponse.fromJson(response.data);
  }
}
