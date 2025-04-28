import '../../data/models/login_response.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call({required String phoneNumber, required String password}) {
    return repository.login(phoneNumber: phoneNumber, password: password);
  }
}
