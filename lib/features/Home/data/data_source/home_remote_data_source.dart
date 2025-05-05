import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/top_doctors_response.dart';

abstract class HomeRemoteDataSource {
  Future<TopDoctorsResponse> getTopDoctors();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<TopDoctorsResponse> getTopDoctors() async {
    final response = await dio.get(ApiEndpoints.topDoctors);
    return TopDoctorsResponse.fromJson(response.data);
  }
}
