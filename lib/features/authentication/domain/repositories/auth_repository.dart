import '../../data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({required String phoneNumber, required String password});
  Future<void> logout();
}
