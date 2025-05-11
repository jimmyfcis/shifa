import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final DoctorDetailsResponse doctorDetailsResponse;

  DoctorLoaded(this.doctorDetailsResponse);
}

class DoctorFailure extends DoctorState {
  final String message;
  final int statusCode;
  DoctorFailure(this.message, this.statusCode);
}
