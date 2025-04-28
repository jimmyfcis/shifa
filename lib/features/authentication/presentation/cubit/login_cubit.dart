import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  Future<void> login(String phoneNumber, String password) async {
    try {
      emit(LoginLoading());
      final loginResponse = await loginUseCase(
          phoneNumber: phoneNumber, password: password);
      emit(LoginSuccess(loginResponse));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(LoginFailure(failure.message));
    }
  }
}
