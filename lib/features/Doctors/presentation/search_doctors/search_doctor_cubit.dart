import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/models/doctor_model.dart';
import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';
import 'package:shifa/features/Doctors/domain/use_cases/search_doctors_use_case.dart';
import '../../../../core/error/error_handler.dart';
import 'search_doctor_state.dart';
import 'dart:developer' as developer;

class SearchDoctorCubit extends Cubit<SearchDoctorState> {
  final SearchDoctorsUseCase searchDoctorsUseCase;

  SearchDoctorCubit({required this.searchDoctorsUseCase}) : super(SearchDoctorInitial());

  List<Doctor> allDoctors = [];
  String searchQuery = '';

  Future<void> getAllDoctors({
    required String keyword,
  }) async {
    try {
      emit(SearchDoctorLoading());
      final response = await searchDoctorsUseCase(
        keyword: keyword,
      );
      allDoctors=response.doctors??[];
      emit(SearchDoctorLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(SearchDoctorFailure(failure.message, failure.statusCode ?? 0));
    }
  }

  void searchDoctors(String query) {
    searchQuery = query.toLowerCase();
    try {
      if (searchQuery.isEmpty) {
        // If search query is empty, show all clinics
        final response = SearchDoctorsResponse(
             doctors: allDoctors
        );
        emit(SearchDoctorLoaded(response));
      } else {
        // Filter clinics based on search query
        final filteredDoctors = allDoctors.where((doctor) {
          final nameContainsQuery = doctor.name!.toLowerCase().contains(searchQuery)||doctor.nameAR!.contains(searchQuery);
          return nameContainsQuery;
        }).toList();
        final response = SearchDoctorsResponse(
          doctors: filteredDoctors,
        );
        emit(SearchDoctorLoaded(response));
      }
    } catch (e) {
      developer.log('Error during search: $e');
    }
  }
}
