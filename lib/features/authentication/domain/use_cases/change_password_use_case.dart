import 'package:shifa/features/authentication/data/models/forget_password_response.dart';
import '../repositories/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<ForgetPasswordResponse> call({required String currentPassword,required String newPassword}) {
    return repository.changePassword(currentPassword: currentPassword,newPassword:newPassword);
  }
}
