import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/authentication/data/models/user.dart';
import 'package:shifa/features/authentication/domain/use_cases/register_use_case.dart';
import '../../../../../core/error/error_handler.dart';
import '../../../domain/use_cases/login_usecase.dart';
import 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase,required this.registerUseCase}) : super(AuthInitial());

  Future<void> login(String phoneNumber, String password) async {
    try {
      emit(AuthLoading());
      final loginResponse = await loginUseCase(
          phoneNumber: phoneNumber, password: password);
      emit(AuthSuccess(loginResponse));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(AuthFailure(failure.message));
    }
  }
  Future<void> register({required User user}) async {
    try {
      emit(AuthLoading());
      final loginResponse = await registerUseCase(
          user: user);
      emit(AuthSuccess(loginResponse));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(AuthFailure(failure.message));
    }
  }
}
