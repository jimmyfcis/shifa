import 'package:shifa/features/departments/data/models/department_model.dart';
class DepartmentsResponseModel {
  final List<DepartmentModel>? departments;

  DepartmentsResponseModel({required this.departments});

  factory DepartmentsResponseModel.fromJson(Map<String, dynamic> json) {
    return DepartmentsResponseModel(
      departments: (json['departments'] as List?)
          ?.map((doc) => DepartmentModel.fromJson(doc))
          .toList(),
    );
  }
}
