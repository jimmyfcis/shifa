import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/features/Doctors/data/models/doctor_details_response.dart';
import 'package:shifa/features/Doctors/data/models/search_doctors_response.dart';
import '../../../../core/network/dio_client.dart';

abstract class DoctorRemoteDataSource {
  Future<DoctorDetailsResponse> getDoctorDetails({
    required String clinicId,
    required String id,
  });

  Future<SearchDoctorsResponse> getAllDoctors({
    required String keyword,
    required int page
  });
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<DoctorDetailsResponse> getDoctorDetails({
    required String clinicId,
    required String id,
  }) async {
    final response = await dio.post(
      ApiEndpoints.doctorDetails,
      data: {
        'id': id,
        'clinicID': clinicId,
      },
    );
    return DoctorDetailsResponse.fromJson(response.data);
  }

  @override
  Future<SearchDoctorsResponse> getAllDoctors({required String keyword,required int page}) async {
    final response = await dio.get(
      ApiEndpoints.searchAllDoctors,
      queryParameters: {
        "keyword": keyword,
        "page": page,
      },
    );
    return SearchDoctorsResponse.fromJson(response.data);
  }
}
