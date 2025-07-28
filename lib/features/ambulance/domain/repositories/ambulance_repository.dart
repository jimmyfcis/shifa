import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';

abstract class AmbulanceRepository {
  Future<StringResponse> requestAmbulance(AmbulanceRequestModel request);
}