import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import '../models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewResponseModel> getNews({required bool isLeksell});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<NewResponseModel> getNews({required bool isLeksell}) async {
    final response = await dio.get(isLeksell?ApiEndpoints.newsLeksell:ApiEndpoints.news);
    return NewResponseModel.fromJson(response.data);
  }
} 