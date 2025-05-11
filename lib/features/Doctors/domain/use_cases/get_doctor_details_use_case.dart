import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';
import 'package:shifa/features/Doctors/domain/repositories/doctor_repo.dart';

class GetDoctorDetailsUseCase {
  final DoctorRepository repository;

  GetDoctorDetailsUseCase(this.repository);

  Future<DoctorDetailsResponse> call({
    required String clinicId,
    required String id,
  }) async {
    return await repository.getDoctorDetails(clinicId: clinicId, id: id);
  }
}
