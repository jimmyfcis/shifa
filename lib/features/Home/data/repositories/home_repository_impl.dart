import '../../domain/repositories/home_repository.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/doctor_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<List<Doctor>> fetchTopDoctors() async {
    final response = await homeRemoteDataSource.getTopDoctors();
    return response.doctors;
  }
}
