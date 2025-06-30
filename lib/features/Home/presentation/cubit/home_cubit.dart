import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/use_cases/get_top_doctors_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTopDoctorsUseCase getTopDoctorsUseCase;

  HomeCubit({required this.getTopDoctorsUseCase}) : super(HomeInitial());

  Future<void> fetchTopDoctors() async {
    try {
      emit(HomeLoading());
      final response = await getTopDoctorsUseCase();
      emit(HomeLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error);
      emit(HomeFailure(failure.message,failure.statusCode??0));

    }
  }
}
