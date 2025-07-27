import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/My%20Records/presentation/managers/visits/visit_state.dart';
import '../../../domain/use_cases/get_my_visits_use_case.dart';

class VisitCubit extends Cubit<VisitState> {
  final GetMyVisitsUseCase getMyVisitsUseCase;

  VisitCubit({required this.getMyVisitsUseCase}) : super(VisitInitial());

  Future<void> getMyVisits() async {
    try {
      emit(VisitLoading());
      final storage = TokenStorage();
      final user = await storage.getUser();
      String userID = '';
        userID=user?.userId??"";
      final response = await getMyVisitsUseCase(patientID: userID);
      emit(VisitLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(VisitFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 