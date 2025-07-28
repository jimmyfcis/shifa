import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';
import 'package:shifa/features/ambulance/domain/repositories/ambulance_repository.dart';

class RequestAmbulanceUseCase {
  final AmbulanceRepository repository;

  RequestAmbulanceUseCase(this.repository);

  Future<StringResponse> call(AmbulanceRequestModel request) async {
    return await repository.requestAmbulance(request);
  }
}