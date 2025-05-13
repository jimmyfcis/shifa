import '../../data/models/lab_response.dart';
import '../repositories/lab_repository.dart';

class GetLabsUseCase {
  final LabRepository repository;

  GetLabsUseCase(this.repository);

  Future<LabResponse> call({required String patientId}) async {
    return await repository.getLabs(patientId: patientId);
  }
} 