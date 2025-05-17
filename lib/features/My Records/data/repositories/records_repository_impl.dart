import '../../domain/repositories/records_repository.dart';
import '../data_source/records_remote_data_source.dart';
import '../models/records_request_model.dart';
import '../models/records_response_model.dart';

class RecordsRepositoryImpl implements RecordsRepository {
  final RecordsRemoteDataSource remoteDataSource;

  RecordsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<RecordsResponseModel> getRecords(RecordsRequestModel request) {
    return remoteDataSource.getRecords(request);
  }
}