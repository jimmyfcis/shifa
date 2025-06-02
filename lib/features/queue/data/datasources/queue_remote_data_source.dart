import 'package:dio/dio.dart';
import 'package:shifa/core/network/dio_client.dart';
import '../models/tickets_response.dart';
import '../../../../core/network/api_endpoints.dart';

abstract class QueueRemoteDataSource {
  Future<TicketsRootResponse> getTickets(String phone);
}

class QueueRemoteDataSourceImpl implements QueueRemoteDataSource {
  final Dio dio=DioClient().dio;

  QueueRemoteDataSourceImpl();

  @override
  Future<TicketsRootResponse> getTickets(String phone) async {
      final response = await dio.get(
        ApiEndpoints.tickets,
        queryParameters: {
          "phone":phone,
        },
      );
      return TicketsRootResponse.fromJson(response.data);
  }
} 