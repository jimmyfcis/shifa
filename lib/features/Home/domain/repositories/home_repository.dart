import '../../data/models/top_doctors_response.dart';

abstract class HomeRepository {
  Future<TopDoctorsResponse> fetchTopDoctors();
}
