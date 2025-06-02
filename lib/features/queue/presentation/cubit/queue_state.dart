import '../../data/models/tickets_response.dart';

abstract class QueueState {}

class QueueInitial extends QueueState {}

class QueueLoading extends QueueState {}

class QueueLoaded extends QueueState {
  final TicketsResponse response;

  QueueLoaded(this.response);
}

class QueueError extends QueueState {
  final String message;
  final int statusCode;

  QueueError(this.message, this.statusCode);
}
