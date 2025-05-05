import '../../data/models/doctor_model.dart';

abstract class HomeRepository {
  Future<List<Doctor>> fetchTopDoctors();
}
