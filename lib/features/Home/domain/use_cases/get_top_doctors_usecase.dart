import '../../data/models/top_doctors_response.dart';
import '../repositories/home_repository.dart';

class GetTopDoctorsUseCase {
  final HomeRepository repository;

  GetTopDoctorsUseCase(this.repository);

  Future<TopDoctorsResponse> call() async {
    return await repository.fetchTopDoctors();
  }
}
