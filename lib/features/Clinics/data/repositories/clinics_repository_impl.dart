import 'package:shifa/features/Clinics/data/data_source/clinics_remote_data_source.dart';
import 'package:shifa/features/Clinics/data/models/clinics_response.dart';
import 'package:shifa/features/Clinics/domain/repositories/clinics_repository.dart';

class ClinicsRepositoryImpl implements ClinicsRepository {
  final ClinicsRemoteDataSource clinicsRemoteDataSource;

  ClinicsRepositoryImpl({required this.clinicsRemoteDataSource});

  @override
  Future<ClinicsResponse> fetchClinics() async {
    final response = await clinicsRemoteDataSource.getClinics();
    return response;
  }
} 