import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';

import '../models/visit_response.dart';

abstract class VisitRemoteDataSource {
  Future<VisitResponse> getMyVisits();
}

class VisitRemoteDataSourceImpl implements VisitRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<VisitResponse> getMyVisits() async {
    final response = await dio.get(ApiEndpoints.visits);
    return VisitResponse.fromJson(response.data);
  }
} 