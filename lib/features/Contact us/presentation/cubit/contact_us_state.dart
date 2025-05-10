import 'package:shifa/features/Contact%20us/data/models/contact_us_response.dart';

abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {
  final ContactUsResponse response;

  ContactUsSuccess(this.response);
}

class ContactUsFailure extends ContactUsState {
  final String message;
  final int statusCode;

  ContactUsFailure(this.message, this.statusCode);
} 