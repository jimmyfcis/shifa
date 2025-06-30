import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/My%20Records/presentation/managers/records/records_state.dart';
import '../../../../../core/storage/token_storage.dart';
import '../../../data/models/records_request_model.dart';
import '../../../domain/use_cases/get_my_records_use_case.dart';

class RecordsCubit extends Cubit<RecordsState> {
  final GetRecordsUseCase getRecordsUseCase;

  RecordsCubit({required this.getRecordsUseCase}) : super(RecordsInitial());

  Future<void> getMyRecords({required String visitNumber}) async {
    try {
      emit(RecordsLoading());
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
      final response = await getRecordsUseCase(RecordsRequestModel(patientID: userID, visitID: visitNumber));
      emit(RecordsLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(RecordsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 