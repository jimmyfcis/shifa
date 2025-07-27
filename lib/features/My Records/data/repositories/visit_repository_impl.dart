
import '../../domain/repositories/visit_repository.dart';
import '../data_source/visit_remote_data_source.dart';
import '../models/visit_response.dart';

class VisitRepositoryImpl implements VisitRepository {
  final VisitRemoteDataSource visitRemoteDataSource;

  VisitRepositoryImpl({required this.visitRemoteDataSource});

  @override
  Future<VisitResponse> getMyVisits({required String patientID}) async {
    final response = await visitRemoteDataSource.getMyVisits(patientID: patientID);
    return response;
  }
} 