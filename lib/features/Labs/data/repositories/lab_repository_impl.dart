import '../../domain/repositories/lab_repository.dart';
import '../data_source/lab_remote_data_source.dart';
import '../models/lab_response.dart';

class LabRepositoryImpl implements LabRepository {
  final LabRemoteDataSource labRemoteDataSource;

  LabRepositoryImpl({required this.labRemoteDataSource});

  @override
  Future<LabResponse> getLabs({required String patientId}) async {
    final response = await labRemoteDataSource.getLabs(patientId: patientId);
    return response;
  }
} 