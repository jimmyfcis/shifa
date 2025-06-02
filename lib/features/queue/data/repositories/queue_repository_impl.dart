import '../models/tickets_response.dart';
import '../../domain/repositories/queue_repository.dart';
import '../datasources/queue_remote_data_source.dart';

class QueueRepositoryImpl implements QueueRepository {
  final QueueRemoteDataSource remoteDataSource;

  QueueRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TicketsRootResponse> getTickets(String phone) async {
    final response = await remoteDataSource.getTickets(phone);
    return response;
  }
}
