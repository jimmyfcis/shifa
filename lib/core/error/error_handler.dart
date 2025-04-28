import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return NetworkFailure("Connection timed out. Please try again.");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final responseData = error.response?.data;
          if (responseData != null && responseData is Map<String, dynamic>) {
            final errorMessage = responseData['error'] ?? "Server error occurred";
            return ServerFailure(errorMessage);
          }
          return ServerFailure("Something went wrong (status code $statusCode)");

        case DioExceptionType.connectionError:
          return NetworkFailure("No internet connection.");

        case DioExceptionType.cancel:
          return NetworkFailure("Request cancelled.");

        default:
          return UnknownFailure("Unexpected error occurred.");
      }
    } else if (error is FormatException) {
      return ValidationFailure("Bad response format.");
    } else {
      return UnknownFailure("Something went wrong. Please try again.");
    }
  }
}
