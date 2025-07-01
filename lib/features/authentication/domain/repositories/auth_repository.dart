import 'package:shifa/features/authentication/data/models/forget_password_response.dart';

import '../../data/models/login_response.dart';
import '../../data/models/user.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({required String phoneNumber, required String password});

  Future<ForgetPasswordResponse> forgetPassword({required String phoneNumber});

  Future<ForgetPasswordResponse> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<LoginResponse> register({required User user});

  Future<LoginResponse> updateProfile({required User user});

  Future<void> logout();
}
