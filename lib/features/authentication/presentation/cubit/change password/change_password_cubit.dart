import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/error_handler.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({required this.changePasswordUseCase}) : super(ChangePasswordInitial());

  Future<void> changePassword({required String newPassword, required String currentPassword}) async {
    try {
      emit(ChangePasswordLoading());
      final changePasswordResponse =
          await changePasswordUseCase(currentPassword: currentPassword, newPassword: newPassword);
      emit(ChangePasswordSuccess(changePasswordResponse));
    } catch (error, stacktrace) {
      final failure = ErrorHandler.handle(error, stacktrace);
      emit(ChangePasswordFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}
