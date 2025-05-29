import 'package:shifa/features/departments/domain/entities/department_response_model.dart';
import '../repositories/departments_repository.dart';

class GetDepartmentById {
  final DepartmentsRepository repository;

  GetDepartmentById(this.repository);

  Future<DepartmentDetailsResponse> call(int id) async {
    return await repository.getDepartmentById(id);
  }
} 