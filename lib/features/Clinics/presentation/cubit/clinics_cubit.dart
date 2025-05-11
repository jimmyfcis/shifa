import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/models/clinic_model.dart';
import 'package:shifa/features/Clinics/data/models/clinics_response.dart';
import 'package:shifa/features/Clinics/domain/use_cases/get_clinics_use_case.dart';
import 'package:shifa/features/Clinics/presentation/cubit/clinics_state.dart';
import 'dart:developer' as developer;
import '../../../../core/error/error_handler.dart';

class ClinicsCubit extends Cubit<ClinicState> {
  final GetClinicsUseCase getClinicsUseCase;
  List<Clinic> allClinics = [];
  String searchQuery = '';

  ClinicsCubit({required this.getClinicsUseCase}) : super(ClinicInitial());

  Future<void> fetchClinics() async {
    try {
      emit(ClinicLoading());
      final response = await getClinicsUseCase();
      allClinics = response.clinics;
      emit(ClinicLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(ClinicFailure(failure.message, failure.statusCode ?? 0));
    }
  }
  
  Future<void> fetchTopDoctors() async {
    await fetchClinics();
  }
  
  void searchClinics(String query) {
    searchQuery = query.toLowerCase();
    try {
      if (searchQuery.isEmpty) {
        // If search query is empty, show all clinics
        final response = ClinicsResponse(
          clinics: allClinics,
        );
        emit(ClinicLoaded(response));
      } else {
        // Filter clinics based on search query
        final filteredClinics = allClinics.where((clinic) {
          final nameContainsQuery = clinic.name.toLowerCase().contains(searchQuery);
          return nameContainsQuery;
        }).toList();
        final response = ClinicsResponse(
          clinics: filteredClinics,
        );
        emit(ClinicLoaded(response));
      }
    } catch (e) {
      developer.log('Error during search: $e');
    }
  }
}
