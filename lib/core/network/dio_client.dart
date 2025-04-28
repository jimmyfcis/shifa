import 'package:dio/dio.dart';
import 'package:shifa/core/network/app_interceptor.dart';
import 'package:shifa/core/storage/token_storage.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio();
    dio.interceptors.add(AppInterceptors(tokenStorage: TokenStorage()));
  }
}
