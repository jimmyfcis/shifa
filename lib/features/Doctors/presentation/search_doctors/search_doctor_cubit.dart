import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Doctors/domain/use_cases/search_doctors_use_case.dart';
import '../../../../core/error/error_handler.dart';
import 'search_doctor_state.dart';

class SearchDoctorCubit extends Cubit<SearchDoctorState> {
  final SearchDoctorsUseCase searchDoctorsUseCase;

  SearchDoctorCubit({required this.searchDoctorsUseCase}) : super(SearchDoctorInitial());

  Future<void> getAllDoctors({
    required String keyword,
  }) async {
    try {
      emit(SearchDoctorLoading());
      final response = await searchDoctorsUseCase(
        keyword: keyword,
      );
      emit(SearchDoctorLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(SearchDoctorFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}
