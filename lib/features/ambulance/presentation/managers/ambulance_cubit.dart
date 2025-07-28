import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';
import 'package:shifa/features/ambulance/domain/use_cases/request_ambulance_use_case.dart';
import 'package:shifa/features/ambulance/presentation/managers/ambulance_state.dart';

class AmbulanceCubit extends Cubit<AmbulanceState> {
  final RequestAmbulanceUseCase requestAmbulanceUseCase;

  AmbulanceCubit({required this.requestAmbulanceUseCase}) : super(AmbulanceInitial());

  Future<void> requestAmbulance({
    required AmbulanceRequestModel request,
  }) async {
    emit(AmbulanceLoading());
    try {
      final response = await requestAmbulanceUseCase(request);
      emit(AmbulanceSuccess(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(AmbulanceFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}