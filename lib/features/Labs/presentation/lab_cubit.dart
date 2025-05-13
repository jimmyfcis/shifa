import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Labs/presentation/lab_state.dart';
import '../../../core/storage/token_storage.dart';
import '../domain/use_cases/get_labs_use_case.dart';

class LabCubit extends Cubit<LabState> {
  final GetLabsUseCase getLabsUseCase;

  LabCubit({required this.getLabsUseCase}) : super(LabInitial());

  Future<void> getLabs() async {
    try {
      emit(LabLoading());
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
      final response = await getLabsUseCase(patientId: userID);
      emit(LabLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(LabFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 