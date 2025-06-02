import 'package:shifa/features/queue/data/models/tickets_response.dart';

import '../repositories/queue_repository.dart';

class GetTicketsUseCase {
  final QueueRepository repository;

  GetTicketsUseCase({required this.repository});

  Future<TicketsResponse> call(String phone) async {
    return await repository.getTickets(phone);
  }
} 