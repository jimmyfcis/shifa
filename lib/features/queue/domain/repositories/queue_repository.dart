import 'package:shifa/features/queue/data/models/tickets_response.dart';

abstract class QueueRepository {
  Future<TicketsResponse> getTickets(String phone);
} 