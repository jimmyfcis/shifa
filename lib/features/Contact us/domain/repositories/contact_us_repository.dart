import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/core/models/string_response.dart';

abstract class ContactUsRepository {
  Future<StringResponse> sendContactForm(ContactUsRequest request);
} 