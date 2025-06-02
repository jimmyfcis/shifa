import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Queue/domain/usecases/get_tickets_usecase.dart';
import 'package:shifa/features/queue/data/models/tickets_response.dart';
import 'package:shifa/features/queue/presentation/cubit/queue_state.dart';


class QueueCubit extends Cubit<QueueState> {
  final GetTicketsUseCase getTicketsUseCase;

  QueueCubit({required this.getTicketsUseCase}) : super(QueueInitial());

  Future<void> getTickets(String phone) async {
    try {
      emit(QueueLoading());
      final TicketsResponse response = await getTicketsUseCase(phone);
      emit(QueueLoaded(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(QueueFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}