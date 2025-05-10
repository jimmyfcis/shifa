import 'package:shifa/features/Clinics/data/models/clinic_model.dart';

class ClinicsResponse {

  final List<Clinic> clinics;

  ClinicsResponse({
    required this.clinics,
  });

  factory ClinicsResponse.fromJson(Map<String, dynamic> json) {
    return ClinicsResponse(
      clinics: (json['clinics'] as List)
          .map((clinic) => Clinic.fromJson(clinic))
          .toList(),
    );
  }
} 