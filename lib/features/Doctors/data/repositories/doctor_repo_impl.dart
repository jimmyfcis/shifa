import 'package:shifa/features/Doctors/data/data_source/doctor_remote_data_source.dart';
import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';
import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';
import '../../domain/repositories/doctor_repo.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepositoryImpl({required this.doctorRemoteDataSource});

  @override
  Future<DoctorDetailsResponse> getDoctorDetails({
    required String clinicId,
    required String id,
  }) async {
    final response = await doctorRemoteDataSource.getDoctorDetails(
      clinicId: clinicId,
      id: id,
    );
    return response;
  }

  @override
  Future<SearchDoctorsResponse> getAllDoctors({required String keyword,required int page}) async{
    final response = await doctorRemoteDataSource.getAllDoctors(
      keyword: keyword,
      page: page
    );
    return response;
  }
}
