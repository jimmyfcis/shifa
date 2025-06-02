import 'package:dio/dio.dart';
import '../models/tickets_response.dart';
import '../../../../core/network/api_endpoints.dart';

abstract class QueueRemoteDataSource {
  Future<TicketsResponse> getTickets(String phone);
}

class QueueRemoteDataSourceImpl implements QueueRemoteDataSource {
  final Dio dio;

  QueueRemoteDataSourceImpl({required this.dio});

  @override
  Future<TicketsResponse> getTickets(String phone) async {
      final response = await dio.get(
        ApiEndpoints.tickets,
        queryParameters: {
          "phone":phone,
        },
      );
      return TicketsResponse.fromJson(response.data);
  }
} 