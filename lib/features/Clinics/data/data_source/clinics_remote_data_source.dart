import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Clinics/data/models/clinics_response.dart';

abstract class ClinicsRemoteDataSource {
  Future<ClinicsResponse> getClinics({bool? isLekxell});
}

class ClinicsRemoteDataSourceImpl implements ClinicsRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<ClinicsResponse> getClinics({bool? isLekxell}) async {
    final response = await dio.get(
      ApiEndpoints.clinics,
      queryParameters: {
        "isLekxell": isLekxell,
      },
    );
    return ClinicsResponse.fromJson(response.data);
  }
}
