import '../../data/models/radiology_response.dart';
import '../repositories/radiology_repository.dart';

class GetRadiologiesUseCase {
  final RadiologyRepository repository;

  GetRadiologiesUseCase(this.repository);

  Future<RadiologyResponse> call({required String patientId}) async {
    return await repository.getRadiologies(patientId: patientId);
  }
} 