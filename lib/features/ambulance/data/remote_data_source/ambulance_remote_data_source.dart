import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';

abstract class AmbulanceRemoteDataSource {
  Future<StringResponse> requestAmbulance(AmbulanceRequestModel request);
}

class AmbulanceRemoteDataSourceImpl implements AmbulanceRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<StringResponse> requestAmbulance(AmbulanceRequestModel request) async {
    final response = await dio.post(
      ApiEndpoints.ambulance,
      data: request.toJson(),
    );
    return StringResponse.fromJson(response.data);
  }
}