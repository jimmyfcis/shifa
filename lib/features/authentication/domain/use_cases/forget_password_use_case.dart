import 'package:shifa/features/authentication/data/models/forget_password_response.dart';
import '../repositories/auth_repository.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<ForgetPasswordResponse> call({required String phoneNumber}) {
    return repository.forgetPassword(phoneNumber: phoneNumber);
  }
}
