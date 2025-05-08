import 'package:shifa/features/Clinics/data/models/clinics_response.dart';

abstract class ClinicsRepository {
  Future<ClinicsResponse> fetchClinics();
} 