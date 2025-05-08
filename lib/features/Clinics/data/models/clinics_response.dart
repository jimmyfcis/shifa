import 'package:shifa/features/Clinics/data/models/clinic_model.dart';

class ClinicsResponse {

  final List<ClinicModel> clinics;

  ClinicsResponse({
    required this.clinics,
  });

  factory ClinicsResponse.fromJson(Map<String, dynamic> json) {
    return ClinicsResponse(
      clinics: (json['clinics'] as List)
          .map((clinic) => ClinicModel.fromJson(clinic))
          .toList(),
    );
  }
} 