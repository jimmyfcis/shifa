import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Radiology/presentation/radiology_state.dart';
import '../../../core/storage/token_storage.dart';
import '../domain/use_cases/get_radiologies_use_case.dart';

class RadiologyCubit extends Cubit<RadiologyState> {
  final GetRadiologiesUseCase getRadiologiesUseCase;

  RadiologyCubit({required this.getRadiologiesUseCase}) : super(RadiologyInitial());

  Future<void> getRadiologies() async {
    try {
      emit(RadiologyLoading());
      final storage = TokenStorage();
      final user = await storage.getUser();
      String userID = '';

      if(user!.patientID!=null &&user.patientID!.isNotEmpty)
      {
        userID=user.patientID!;
      }
      else {
        userID=user.userId??"";

      }
      final response = await getRadiologiesUseCase(patientId: userID);
      emit(RadiologyLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error);
      emit(RadiologyFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 