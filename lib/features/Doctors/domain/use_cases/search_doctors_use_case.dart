import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';
import 'package:shifa/features/Doctors/domain/repositories/doctor_repo.dart';

class SearchDoctorsUseCase {
  final DoctorRepository repository;

  SearchDoctorsUseCase(this.repository);

  Future<SearchDoctorsResponse> call({
    required String keyword,
    required int page,
  }) async {
    return await repository.getAllDoctors(keyword: keyword,page: page);
  }
}
