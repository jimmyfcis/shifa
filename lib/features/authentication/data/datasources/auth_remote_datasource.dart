import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/core/storage/token_storage.dart';
import '../models/login_response.dart';

class AuthRemoteDatasource {
  final Dio dio = DioClient().dio;
  final TokenStorage storage = TokenStorage();

  Future<LoginResponse> login({
    required String phoneNumber,
    required String password,
  }) async {
    final response = await dio.post(
      ApiEndpoints.login,
      queryParameters: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );

    final loginResp = LoginResponse.fromJson(response.data);
    await storage.saveToken(loginResp.token);
    await storage.saveUser(loginResp.user);

    return loginResp;
  }
}
