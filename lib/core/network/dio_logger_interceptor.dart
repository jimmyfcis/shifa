import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shifa/core/routes/app_routes.dart'; // Make sure to import your routes

class DioLoggerInterceptor extends Interceptor {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void _printPrettyJson(dynamic data) {
    const encoder = JsonEncoder.withIndent('  ');
    final prettyJson = encoder.convert(data);
    print(prettyJson);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("=================== API REQUEST ===================");
    print("METHOD: ${options.method}");
    print("URL: ${options.uri}");
    print("HEADERS:");
    _printPrettyJson(options.headers);
    if (options.data != null) {
      print("BODY:");
      try {
        _printPrettyJson(options.data);
      } catch (e) {
        print("RAW BODY: ${options.data.toString()}");
      }
    }
    print("====================================================");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("=================== API RESPONSE ===================");
    print("STATUS CODE: ${response.statusCode}");
    print("URL: ${response.requestOptions.uri}");
    if (response.data != null) {
      print("RESPONSE BODY:");
      try {
        _printPrettyJson(response.data);
      } catch (e) {
        print("RAW RESPONSE: ${response.data.toString()}");
      }
    }
    print("====================================================");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("=================== API ERROR =====================");
    print("URL: ${err.requestOptions.uri}");
    print("MESSAGE: ${err.message}");
    if (err.response != null && err.response?.data != null) {
      print("ERROR RESPONSE:");
      try {
        _printPrettyJson(err.response?.data);
      } catch (e) {
        print("RAW ERROR RESPONSE: ${err.response?.data.toString()}");
      }
    }

    // Handle 401 Unauthorized error and show a dialog
    if (err.response?.statusCode == 401) {
      _showSessionExpiredDialog(navigatorKey.currentContext!);
    }

    print("====================================================");
    super.onError(err, handler);
  }

  // Show a dialog with message "Your session expired. Please login to continue"
  void _showSessionExpiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Session Expired"),
          content: Text("Your session expired. Please login to continue."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.login, (route) => false);
              },
              child: Text("Login"),
            ),
          ],
        );
      },
    );
  }
}
