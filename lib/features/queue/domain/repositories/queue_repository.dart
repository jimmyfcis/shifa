import '../../data/models/tickets_response.dart';

abstract class QueueRepository {
  Future<TicketsRootResponse> getTickets(String phone);
} 