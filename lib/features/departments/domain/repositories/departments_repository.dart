import '../entities/department_response_model.dart';
import '../entities/departments_response_model.dart';

abstract class DepartmentsRepository {
  Future<DepartmentsResponseModel> getAllDepartments();
  Future<DepartmentDetailsResponse> getDepartmentById(int id);
} 