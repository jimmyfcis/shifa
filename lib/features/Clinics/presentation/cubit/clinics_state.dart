import 'package:shifa/features/Clinics/data/models/clinics_response.dart';

abstract class ClinicState {}

class ClinicInitial extends ClinicState {}

class ClinicLoading extends ClinicState {}

class ClinicLoaded extends ClinicState {
  final ClinicsResponse clinicsResponse;

  ClinicLoaded(this.clinicsResponse);
}

class ClinicFailure extends ClinicState {
  final String message;
  final int statusCode;
  ClinicFailure(this.message, this.statusCode);
}
