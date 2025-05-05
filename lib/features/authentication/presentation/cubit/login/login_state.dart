import '../../../data/models/login_response.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponse loginResponse;
  AuthSuccess(this.loginResponse);
}

class AuthFailure extends AuthState {
  final String message;
  final int statusCode;
  AuthFailure(this.message, this.statusCode);
}
