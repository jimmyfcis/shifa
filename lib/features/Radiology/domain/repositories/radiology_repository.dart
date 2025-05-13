import '../../data/models/radiology_response.dart';

abstract class RadiologyRepository {
  Future<RadiologyResponse> getRadiologies({required String patientId});
} 