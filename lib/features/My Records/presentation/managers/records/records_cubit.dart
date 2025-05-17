import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/My%20Records/presentation/managers/records/records_state.dart';
import '../../../data/models/records_request_model.dart';
import '../../../domain/use_cases/get_my_records_use_case.dart';

class RecordsCubit extends Cubit<RecordsState> {
  final GetRecordsUseCase getRecordsUseCase;

  RecordsCubit({required this.getRecordsUseCase}) : super(RecordsInitial());

  Future<void> getMyRecords({required RecordsRequestModel recordsRequestModel}) async {
    try {
      emit(RecordsLoading());
      final response = await getRecordsUseCase(recordsRequestModel);
      emit(RecordsLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(RecordsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 