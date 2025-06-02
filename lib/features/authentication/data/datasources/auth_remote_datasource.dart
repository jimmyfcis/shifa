import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/authentication/data/models/forget_password_response.dart';
import 'package:shifa/features/authentication/data/models/login_response.dart';
import 'package:shifa/features/authentication/data/models/user.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponse> login({
    required String phoneNumber,
    required String password,
  });

  Future<LoginResponse> register({required User user});

  Future<LoginResponse> updateProfile({required User user});

  Future<void> logout();

  Future<ForgetPasswordResponse> forgetPassword({
    required String phoneNumber,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio = DioClient().dio;
  final TokenStorage storage = TokenStorage();

  @override
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
    await storage.savePassword(password);

    return loginResp;
  }

  @override
  Future<void> logout() async {
    try {
      final response = await dio.post(ApiEndpoints.logout); // No need to pass token manually

      if (response.statusCode == 200 && response.data['success'] == true) {
        await storage.clearToken();
      } else {
        throw Exception(response.data['message'] ?? 'Logout failed');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Token expired or invalid — handled in interceptor, but still clear token locally
        await storage.clearToken();
      }
      rethrow; // Let interceptor handle UI
    }
  }

  @override
  Future<LoginResponse> register({required User user}) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: user.toJson(),
    );
    final loginResp = LoginResponse.fromJson(response.data);
    await storage.saveToken(loginResp.token);
    await storage.saveUser(loginResp.user);

    return loginResp;
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword({required String phoneNumber}) async {
    final response = await dio.post(
      ApiEndpoints.forgetPassword,
      data: {
        'phone': phoneNumber,
      },
    );

    final forgetResponse = ForgetPasswordResponse.fromJson(response.data);

    return forgetResponse;
  }

  @override
  Future<LoginResponse> updateProfile({required User user}) async {
    final response = await dio.post(
      ApiEndpoints.updateProfile,
      data: user.toJson(),
    );
    final loginResp = LoginResponse.fromJson(response.data);
    await storage.saveUser(loginResp.user);

    return loginResp;
  }
}
