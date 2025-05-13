import '../../domain/repositories/radiology_repository.dart';
import '../data_source/radiology_remote_data_source.dart';
import '../models/radiology_response.dart';

class RadiologyRepositoryImpl implements RadiologyRepository {
  final RadiologyRemoteDataSource radiologyRemoteDataSource;

  RadiologyRepositoryImpl({required this.radiologyRemoteDataSource});

  @override
  Future<RadiologyResponse> getRadiologies({required String patientId}) async {
    final response = await radiologyRemoteDataSource.getRadiologies(patientId: patientId);
    return response;
  }
} 