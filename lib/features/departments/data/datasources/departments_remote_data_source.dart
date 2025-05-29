import 'package:dio/dio.dart';
import 'package:shifa/features/departments/domain/entities/department_response_model.dart';
import 'package:shifa/features/departments/domain/entities/departments_response_model.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';

abstract class DepartmentsRemoteDataSource {
  Future<DepartmentsResponseModel> getAllDepartments();
  Future<DepartmentDetailsResponse> getDepartmentById(int id);
}

class DepartmentsRemoteDataSourceImpl implements DepartmentsRemoteDataSource {
  final Dio dio = DioClient().dio;

  DepartmentsRemoteDataSourceImpl();

  @override
  Future<DepartmentsResponseModel> getAllDepartments() async {
    final response = await dio.get(
      ApiEndpoints.getAllDepartments,
    );
    return DepartmentsResponseModel.fromJson(response.data);
  }

  @override
  Future<DepartmentDetailsResponse> getDepartmentById(int id) async {
    final response = await dio.get(
      "${ApiEndpoints.getDepartmentById}$id",
    );
    return DepartmentDetailsResponse.fromJson(response.data);
  }
} 