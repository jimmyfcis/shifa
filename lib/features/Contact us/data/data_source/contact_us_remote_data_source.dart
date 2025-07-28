import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/core/models/string_response.dart';

abstract class ContactUsRemoteDataSource {
  Future<StringResponse> sendContactForm(ContactUsRequest request);
}

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<StringResponse> sendContactForm(ContactUsRequest request) async {
    final response = await dio.post(
      ApiEndpoints.contactUs,
      data: request.toJson(),
    );
    return StringResponse.fromJson(response.data);
  }
} 