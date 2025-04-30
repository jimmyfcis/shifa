import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/error_handler.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitial());

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      await logoutUseCase();
      emit(LogoutSuccess());
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(LogoutFailure(failure.message));
    }
  }
}
