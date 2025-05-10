import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Contact%20us/data/models/contact_us_request.dart';
import 'package:shifa/features/Contact%20us/domain/use_cases/send_contact_form_use_case.dart';
import 'package:shifa/features/Contact%20us/presentation/cubit/contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final SendContactFormUseCase sendContactFormUseCase;

  ContactUsCubit({required this.sendContactFormUseCase}) : super(ContactUsInitial());

  Future<void> sendContactForm({
    required String name,
    required String email,
    required String message,
    String? phone,
    String? subject,
  }) async {
    emit(ContactUsLoading());
    try {
      final request = ContactUsRequest(
        name: name,
        email: email,
        message: message,
        phone: phone,
        subject: subject,
      );
      
      final response = await sendContactFormUseCase(request);
      emit(ContactUsSuccess(response));
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      emit(ContactUsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 