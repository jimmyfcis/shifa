import 'package:shifa/features/authentication/data/models/forget_password_response.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordResponse forgetPasswordResponse;
  ForgetPasswordSuccess(this.forgetPasswordResponse);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;
  final int statusCode;
  ForgetPasswordFailure(this.message, this.statusCode);
}
