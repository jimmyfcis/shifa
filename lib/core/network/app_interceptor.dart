import 'package:dio/dio.dart';
import 'package:shifa/core/storage/token_storage.dart';

class AppInterceptors extends Interceptor {
  final TokenStorage tokenStorage;

  AppInterceptors({required this.tokenStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStorage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data['status'] == 0) {
        final errorMessage = data['error'] ?? "Server error occurred";
        // Throwing a DioException for business error handling
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: errorMessage,
          ),
          true,
        );
        return;
      }
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
