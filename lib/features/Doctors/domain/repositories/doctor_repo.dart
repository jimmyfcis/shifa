import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';

abstract class DoctorRepository {
  Future<DoctorDetailsResponse> getDoctorDetails({
    required String clinicId,
    required String id,
  });
}
