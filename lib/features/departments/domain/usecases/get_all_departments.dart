import 'package:shifa/features/departments/domain/entities/departments_response_model.dart';

import '../repositories/departments_repository.dart';

class GetAllDepartments {
  final DepartmentsRepository repository;

  GetAllDepartments(this.repository);

  Future<DepartmentsResponseModel> call() async {
    return await repository.getAllDepartments();
  }
} 