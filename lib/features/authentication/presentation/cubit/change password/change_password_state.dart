import 'package:shifa/features/authentication/data/models/forget_password_response.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ForgetPasswordResponse forgetPasswordResponse;
  ChangePasswordSuccess(this.forgetPasswordResponse);
}

class ChangePasswordFailure extends ChangePasswordState {
  final String message;
  final int statusCode;
  ChangePasswordFailure(this.message, this.statusCode);
}
