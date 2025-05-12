
import '../../data/models/visit_response.dart';

abstract class VisitRepository {
  Future<VisitResponse> getMyVisits();
} 