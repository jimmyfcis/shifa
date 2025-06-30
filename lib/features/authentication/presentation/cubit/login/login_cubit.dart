import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/authentication/data/models/user.dart';
import 'package:shifa/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:shifa/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:shifa/features/authentication/domain/use_cases/update_profile_use_case.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../../../core/routes/app_routes.dart';
import 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  AuthCubit({
    required this.updateProfileUseCase,
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(AuthInitial());

  Future<void> login(String phoneNumber, String password) async {
    try {
      emit(AuthLoading());
      final loginResponse = await loginUseCase(
          phoneNumber: phoneNumber, password: password);
      emit(AuthSuccess(loginResponse));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(AuthFailure(failure.message, failure.statusCode ?? 0));
    }
  }

  Future<void> register({required User user}) async {
    try {
      emit(AuthLoading());
      final loginResponse = await registerUseCase(user: user);
      emit(AuthSuccess(loginResponse));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(AuthFailure(failure.message, failure.statusCode ?? 0));
    }
  }

  Future<void> updateProfile({required User user}) async {
    try {
      emit(AuthLoading());
      final loginResponse = await updateProfileUseCase(user: user);
      emit(AuthSuccess(loginResponse));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(AuthFailure(failure.message, failure.statusCode ?? 0));
    }
  }

  Future<void> checkRememberAndLogin(BuildContext context) async {
    final tokenStorage = TokenStorage();
    await Future.delayed(const Duration(seconds: 3));
    final isRemember = await tokenStorage.getRemember() ?? false;
    final user = await tokenStorage.getUser();
    final password = await tokenStorage.getPassword();

    if (isRemember &&
        user != null &&
        user.phoneNumber != null &&
        user.phoneNumber!.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      login(user.phoneNumber!, password);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.languageSplash);
    }
  }
}
