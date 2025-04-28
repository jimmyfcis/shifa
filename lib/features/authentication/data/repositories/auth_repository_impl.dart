import 'package:shifa/core/storage/token_storage.dart';
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
    await tokenStorage.saveToken(loginResponse.token);
    return loginResponse;
  }
}
