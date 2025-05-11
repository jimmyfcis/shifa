import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Doctors/domain/use_cases/get_doctor_details_use_case.dart';
import '../../../../core/error/error_handler.dart';
import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final GetDoctorDetailsUseCase getDoctorDetailsUseCase;

  DoctorCubit({required this.getDoctorDetailsUseCase}) : super(DoctorInitial());

  Future<void> fetchTopDoctors({
    required String clinicId,
    required String id,
  }) async {
    try {
      emit(DoctorLoading());
      final response = await getDoctorDetailsUseCase(
        clinicId: clinicId,
        id: id,
      );
      emit(DoctorLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(DoctorFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}
