import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/usecases/get_all_departments.dart';
import '../../domain/usecases/get_department_by_id.dart';
import 'departments_state.dart';

class DepartmentsCubit extends Cubit<DepartmentsState> {
  final GetAllDepartments getAllDepartments;
  final GetDepartmentById getDepartmentById;

  DepartmentsCubit({
    required this.getAllDepartments,
    required this.getDepartmentById,
  }) : super(DepartmentsInitial());

  Future<void> loadDepartments({required bool isLeksell}) async {
    try {
      emit(DepartmentsLoading());
      final departments = await getAllDepartments(isLeksell:isLeksell);
      emit(DepartmentsLoaded(departments));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(DepartmentsError(failure.message, failure.statusCode ?? 0));
    }
  }

  Future<void> loadDepartmentById(int id) async {
    emit(DepartmentsLoading());
    try {
      final department = await getDepartmentById(id);
      emit(DepartmentLoaded(department));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(DepartmentsError(failure.message, failure.statusCode ?? 0));
    }
  }
} 