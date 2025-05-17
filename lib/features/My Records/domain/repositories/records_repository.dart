import '../../data/models/records_request_model.dart';
import '../../data/models/records_response_model.dart';

abstract class RecordsRepository {
  Future<RecordsResponseModel> getRecords(RecordsRequestModel request);
}