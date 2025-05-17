import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/records_request_model.dart';
import '../models/records_response_model.dart';

abstract class RecordsRemoteDataSource {
  Future<RecordsResponseModel> getRecords(RecordsRequestModel request);
}

class RecordsRemoteDataSourceImpl implements RecordsRemoteDataSource {
  final Dio dio = DioClient().dio;

  RecordsRemoteDataSourceImpl();

  @override
  Future<RecordsResponseModel> getRecords(RecordsRequestModel request) async {
    final response = await dio.get(
      ApiEndpoints.records,
      queryParameters: request.toJson(),
    );
    return RecordsResponseModel.fromJson(response.data['records']);
  }
}