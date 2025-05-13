import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Radiology/presentation/radiology_state.dart';
import '../domain/use_cases/get_radiologies_use_case.dart';

class RadiologyCubit extends Cubit<RadiologyState> {
  final GetRadiologiesUseCase getRadiologiesUseCase;

  RadiologyCubit({required this.getRadiologiesUseCase}) : super(RadiologyInitial());

  Future<void> getRadiologies({required String patientId}) async {
    try {
      emit(RadiologyLoading());
      final response = await getRadiologiesUseCase(patientId: patientId);
      emit(RadiologyLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(RadiologyFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 