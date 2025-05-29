import 'package:shifa/features/departments/domain/entities/department_response_model.dart';
import '../../domain/entities/departments_response_model.dart';

abstract class DepartmentsState {}

class DepartmentsInitial extends DepartmentsState {}

class DepartmentsLoading extends DepartmentsState {}

class DepartmentsLoaded extends DepartmentsState {
  final DepartmentsResponseModel response;

  DepartmentsLoaded(this.response);
}

class DepartmentLoaded extends DepartmentsState {
  final DepartmentDetailsResponse response;

  DepartmentLoaded(this.response);
}

class DepartmentsError extends DepartmentsState {
  final String message;
  final int statusCode;

  DepartmentsError(this.message, this.statusCode);
}
