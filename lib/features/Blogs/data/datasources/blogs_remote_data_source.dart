import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Blogs/data/models/blog_model.dart';

abstract class BlogsRemoteDataSource {
  Future<BlogsResponse> getBlogs({required bool isHome});
}

class BlogsRemoteDataSourceImpl implements BlogsRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<BlogsResponse> getBlogs({required bool isHome}) async {
    if (isHome) {
      final response = await dio.get(ApiEndpoints.articlesHome);
      return BlogsResponse.fromJson(response.data);
    }
    else {
      final response = await dio.get(ApiEndpoints.articles);
      return BlogsResponse.fromJson(response.data);
    }
  }
} 