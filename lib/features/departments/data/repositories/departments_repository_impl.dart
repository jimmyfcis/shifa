import 'package:shifa/features/departments/domain/entities/department_response_model.dart';
import 'package:shifa/features/departments/domain/entities/departments_response_model.dart';
import '../../domain/repositories/departments_repository.dart';
import '../datasources/departments_remote_data_source.dart';

class DepartmentsRepositoryImpl implements DepartmentsRepository {
  final DepartmentsRemoteDataSource remoteDataSource;

  DepartmentsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DepartmentsResponseModel> getAllDepartments({required bool isLeksell}) async {
    final departments = await remoteDataSource.getAllDepartments(isLeksell:isLeksell);
    return departments;
  }

  @override
  Future<DepartmentDetailsResponse> getDepartmentById(int id) async {
    final department = await remoteDataSource.getDepartmentById(id);
    return department;
  }
} 