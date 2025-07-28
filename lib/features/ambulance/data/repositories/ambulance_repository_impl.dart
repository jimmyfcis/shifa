import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';
import 'package:shifa/features/ambulance/data/remote_data_source/ambulance_remote_data_source.dart';
import 'package:shifa/features/ambulance/domain/repositories/ambulance_repository.dart';

class AmbulanceRepositoryImpl implements AmbulanceRepository {
  final AmbulanceRemoteDataSource ambulanceRemoteDataSource;

  AmbulanceRepositoryImpl({required this.ambulanceRemoteDataSource});

  @override
  Future<StringResponse> requestAmbulance(AmbulanceRequestModel request) async {
    final response = await ambulanceRemoteDataSource.requestAmbulance(request);
    return response;
  }
}