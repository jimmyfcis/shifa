import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Radiology/data/models/radiology_response.dart';

abstract class RadiologyRemoteDataSource {
  Future<RadiologyResponse> getRadiologies({required String patientId});
}

class RadiologyRemoteDataSourceImpl implements RadiologyRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<RadiologyResponse> getRadiologies({required String patientId}) async {
    final response = await dio.post(
      ApiEndpoints.radiology,
      data: {'patientID': patientId},
    );
    return RadiologyResponse.fromJson(response.data);
  }
} 