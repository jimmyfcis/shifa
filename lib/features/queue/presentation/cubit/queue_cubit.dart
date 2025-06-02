import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/error_handler.dart';
import '../../data/models/tickets_response.dart';
import '../../domain/usecases/get_tickets_usecase.dart';
import 'queue_state.dart';

class QueueCubit extends Cubit<QueueState> {
  final GetTicketsUseCase getTicketsUseCase;

  QueueCubit({required this.getTicketsUseCase}) : super(QueueInitial());

  Future<void> getTickets(String phone) async {
    emit(QueueLoading());
    try {
      final TicketsResponse response = await getTicketsUseCase(phone);
      emit(QueueLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(QueueError(failure.message, failure.statusCode ?? 0));
    }
  }
}