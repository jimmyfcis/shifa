import 'package:shifa/features/Clinics/data/models/clinics_response.dart';
import 'package:shifa/features/Clinics/domain/repositories/clinics_repository.dart';

class GetClinicsUseCase {
  final ClinicsRepository repository;

  GetClinicsUseCase(this.repository);

  Future<ClinicsResponse> call() async {
    return await repository.fetchClinics();
  }
} 