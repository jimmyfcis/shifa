import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/authentication/domain/use_cases/forget_password_use_case.dart';
import '../../../../../core/error/error_handler.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit({required this.forgetPasswordUseCase}) : super(ForgetPasswordInitial());

  Future<void> forgetPassword(String phoneNumber) async {
    try {
      emit(ForgetPasswordLoading());
      final forgetPasswordResponse = await forgetPasswordUseCase(
          phoneNumber: phoneNumber);
      emit(ForgetPasswordSuccess(forgetPasswordResponse));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(ForgetPasswordFailure(failure.message,failure.statusCode??0));
    }
  }
}
