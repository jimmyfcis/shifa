import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/authentication/data/models/forget_password_response.dart';
import 'package:shifa/features/authentication/data/models/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.tokenStorage,
  });

  @override
  Future<LoginResponse> login({required String phoneNumber, required String password}) async {
    final loginResponse = await remoteDatasource.login(phoneNumber: phoneNumber, password: password);
    return loginResponse;
  }

  @override
  Future<void> logout() async {
    return await remoteDatasource.logout();
  }

  @override
  Future<LoginResponse> register({required User user}) async {
    final loginResponse = await remoteDatasource.register(user: user);
    return loginResponse;
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword({required String phoneNumber}) async {
    final forgetResponse = await remoteDatasource.forgetPassword(phoneNumber: phoneNumber);
    return forgetResponse;
  }

  @override
  Future<LoginResponse> updateProfile({required User user}) async {
    final loginResponse = await remoteDatasource.updateProfile(user: user);
    return loginResponse;
  }
}
