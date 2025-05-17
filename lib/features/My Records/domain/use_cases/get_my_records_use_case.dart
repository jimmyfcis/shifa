import '../repositories/records_repository.dart';
import '../../data/models/records_request_model.dart';
import '../../data/models/records_response_model.dart';

class GetRecordsUseCase {
  final RecordsRepository repository;

  GetRecordsUseCase(this.repository);

  Future<RecordsResponseModel> call(RecordsRequestModel request) {
    return repository.getRecords(request);
  }
}