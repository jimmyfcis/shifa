import 'package:shifa/features/departments/data/models/department_model.dart';

class DepartmentDetailsResponse {
  final DepartmentModel department;

  DepartmentDetailsResponse({required this.department});

  factory DepartmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DepartmentDetailsResponse(
      department: DepartmentModel.fromJson(json['department']),
    );
  }
}
