import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';

import '../../data/models/search_doctors_response.dart';

abstract class DoctorRepository {
  Future<DoctorDetailsResponse> getDoctorDetails({
    required String clinicId,
    required String id,
  });

  Future<SearchDoctorsResponse> getAllDoctors({
    required String keyword,
    required int page,
  });
}
