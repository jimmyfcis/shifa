import 'package:shifa/core/models/string_response.dart';

abstract class AmbulanceState {}

class AmbulanceInitial extends AmbulanceState {}

class AmbulanceLoading extends AmbulanceState {}

class AmbulanceSuccess extends AmbulanceState {
  final StringResponse response;

  AmbulanceSuccess(this.response);
}

class AmbulanceFailure extends AmbulanceState {
  final String message;
  final int statusCode;

  AmbulanceFailure(this.message, this.statusCode);
}