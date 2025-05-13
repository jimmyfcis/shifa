import '../../data/models/lab_response.dart';

abstract class LabRepository {
  Future<LabResponse> getLabs({required String patientId});
} 