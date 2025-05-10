import 'package:dio/dio.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_response.dart';

abstract class ContactUsRemoteDataSource {
  Future<ContactUsResponse> sendContactForm(ContactUsRequest request);
}

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<ContactUsResponse> sendContactForm(ContactUsRequest request) async {
    final response = await dio.post(
      ApiEndpoints.contactUs,
      data: request.toJson(),
    );
    return ContactUsResponse.fromJson(response.data);
  }
} 