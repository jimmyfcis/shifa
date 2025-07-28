import 'package:shifa/features/Contact%20us/data/data_source/contact_us_remote_data_source.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/Contact%20us/domain/repositories/contact_us_repository.dart';

class ContactUsRepositoryImpl implements ContactUsRepository {
  final ContactUsRemoteDataSource contactUsRemoteDataSource;

  ContactUsRepositoryImpl({required this.contactUsRemoteDataSource});

  @override
  Future<StringResponse> sendContactForm(ContactUsRequest request) async {
    final response = await contactUsRemoteDataSource.sendContactForm(request);
    return response;
  }
} 