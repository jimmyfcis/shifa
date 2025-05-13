import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Labs/data/models/lab_response.dart';

abstract class LabRemoteDataSource {
  Future<LabResponse> getLabs({required String patientId});
}

class LabRemoteDataSourceImpl implements LabRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<LabResponse> getLabs({required String patientId}) async {
    final response = await dio.post(
      ApiEndpoints.labs,
      data: {'patientID': patientId},
    );
    return LabResponse.fromJson(response.data);
  }
} 