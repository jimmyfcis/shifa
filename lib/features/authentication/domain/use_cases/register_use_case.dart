import 'package:shifa/features/authentication/data/models/user.dart';

import '../../data/models/login_response.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<LoginResponse> call({required User user}) {
    return repository.register(user: user);
  }
}
