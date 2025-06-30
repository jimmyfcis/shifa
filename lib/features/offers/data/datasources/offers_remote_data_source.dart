import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import '../models/offers_model.dart';

abstract class OffersRemoteDataSource {
  Future<OffersResponseModel> getOffers();
}

class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<OffersResponseModel> getOffers() async {
    final response = await dio.get(ApiEndpoints.offers);
    return OffersResponseModel.fromJson(response.data);
  }
} 