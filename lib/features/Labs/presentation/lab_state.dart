import '../data/models/lab_response.dart';

abstract class LabState {}

class LabInitial extends LabState {}

class LabLoading extends LabState {}

class LabLoaded extends LabState {
  final LabResponse labResponse;

  LabLoaded(this.labResponse);
}

class LabFailure extends LabState {
  final String message;
  final int statusCode;
  
  LabFailure(this.message, this.statusCode);
} 