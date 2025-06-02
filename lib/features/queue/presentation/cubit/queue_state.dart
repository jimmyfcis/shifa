
import 'package:shifa/features/queue/data/models/tickets_response.dart';

abstract class QueueState {}

class QueueInitial extends QueueState {}

class QueueLoading extends QueueState {}

class QueueLoaded extends QueueState {
  final TicketsResponse ticketsResponse;

  QueueLoaded(this.ticketsResponse);
}

class QueueFailure extends QueueState {
  final String message;
  final int statusCode;

  QueueFailure(this.message, this.statusCode);
}
