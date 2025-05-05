import '../../data/models/doctor_model.dart';
import '../repositories/home_repository.dart';

class GetTopDoctorsUseCase {
  final HomeRepository repository;

  GetTopDoctorsUseCase(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.fetchTopDoctors();
  }
}
