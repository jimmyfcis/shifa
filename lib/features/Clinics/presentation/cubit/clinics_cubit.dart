import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Clinics/domain/use_cases/get_clinics_use_case.dart';
import 'package:shifa/features/Clinics/presentation/cubit/clinics_state.dart';
import '../../../../core/error/error_handler.dart';

class ClinicsCubit extends Cubit<ClinicState> {
  final GetClinicsUseCase getClinicsUseCase;

  ClinicsCubit({required this.getClinicsUseCase}) : super(ClinicInitial());

  Future<void> fetchClinics() async {
    try {
      emit(ClinicLoading());
      final response = await getClinicsUseCase();
      emit(ClinicLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(ClinicFailure(failure.message,failure.statusCode??0));

    }
  }
}
