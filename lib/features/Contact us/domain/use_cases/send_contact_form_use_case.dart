import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/core/models/string_response.dart';
import 'package:shifa/features/Contact%20us/domain/repositories/contact_us_repository.dart';

class SendContactFormUseCase {
  final ContactUsRepository repository;

  SendContactFormUseCase(this.repository);

  Future<StringResponse> call(ContactUsRequest request) async {
    return await repository.sendContactForm(request);
  }
} 