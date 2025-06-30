import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';

abstract class SearchDoctorState {}

class SearchDoctorInitial extends SearchDoctorState {}

class SearchDoctorLoading extends SearchDoctorState {}

class SearchDoctorLoaded extends SearchDoctorState {
  final SearchDoctorsResponse searchDoctorsResponse;

  SearchDoctorLoaded(this.searchDoctorsResponse);
}

class SearchDoctorFailure extends SearchDoctorState {
  final String message;
  final int statusCode;
  SearchDoctorFailure(this.message, this.statusCode);
}
