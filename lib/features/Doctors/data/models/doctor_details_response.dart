import '../../../../core/models/doctor_model.dart';

class DoctorDetailsResponse {
  final Doctor doctor;

  DoctorDetailsResponse({required this.doctor});

  factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsResponse(
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}
