import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/models/doctor_model.dart';
import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';
import 'package:shifa/features/Doctors/domain/use_cases/search_doctors_use_case.dart';
import '../../../../core/error/error_handler.dart';
import 'search_doctor_state.dart';

class SearchDoctorCubit extends Cubit<SearchDoctorState> {
  final SearchDoctorsUseCase searchDoctorsUseCase;

  SearchDoctorCubit({required this.searchDoctorsUseCase}) : super(SearchDoctorInitial());

  List<Doctor> allDoctors = [];
  String searchQuery = '';

  Future<void> getAllDoctors({
    required String keyword,
    required int page,
  }) async {
    try {
      emit(SearchDoctorLoading());
      final response = await searchDoctorsUseCase(
        keyword: keyword,
        page: page,
      );
      allDoctors = response.doctors ?? [];
      emit(SearchDoctorLoaded(response));
    } catch (error, stacktrace) {
      final failure = ErrorHandler.handle(error, stacktrace);
      emit(SearchDoctorFailure(failure.message, failure.statusCode ?? 0));
    }
  }

  bool doctorsHaveMore() {
    final SearchDoctorLoaded currState = state as SearchDoctorLoaded;
    return currState.searchDoctorsResponse.doctors!.length < currState.searchDoctorsResponse.pagination!.total!;
  }

  int getCurrentPageNumber() {
    final SearchDoctorLoaded currState = state as SearchDoctorLoaded;
    return currState.searchDoctorsResponse.pagination!.currentPage!;
  }
  Future<void> getDoctorsLoadMore(int pageNumber) async {
    final SearchDoctorLoaded currState = state as SearchDoctorLoaded;
    emit(SearchDoctorLoaded( currState.searchDoctorsResponse));

    //Pagination pagination = Pagination(page: pageNumber);
    SearchDoctorsResponse doctorsResponseModel = await searchDoctorsUseCase(page: pageNumber,keyword: "");

   if (doctorsResponseModel.doctors!=null &&doctorsResponseModel.doctors!.isNotEmpty)
    {
      doctorsResponseModel.doctors!.insertAll(0, currState.searchDoctorsResponse.doctors??[]);
          emit(SearchDoctorLoaded( doctorsResponseModel));
    }
    else{
    emit(SearchDoctorFailure( "No Doctors",404));
    }
  }
}
