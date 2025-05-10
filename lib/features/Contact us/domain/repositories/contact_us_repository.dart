import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_response.dart';

abstract class ContactUsRepository {
  Future<ContactUsResponse> sendContactForm(ContactUsRequest request);
} 