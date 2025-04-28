import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';

import '../models/login_response.dart';

class AuthRemoteDatasource {
  final Dio dio = DioClient().dio;

  Future<LoginResponse> login({required String phoneNumber, required String password}) async {
    final response = await dio.post(ApiEndpoints.login, queryParameters: {
      'phoneNumber': phoneNumber,
      'password': password,
    });

    return LoginResponse.fromJson(response.data);
  }
}
