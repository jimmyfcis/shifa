import '../../data/models/visit_response.dart';
import '../repositories/visit_repository.dart';

class GetMyVisitsUseCase {
  final VisitRepository repository;

  GetMyVisitsUseCase(this.repository);

  Future<VisitResponse> call() async {
    return await repository.getMyVisits();
  }
} 