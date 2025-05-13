import '../data/models/radiology_response.dart';

abstract class RadiologyState {}

class RadiologyInitial extends RadiologyState {}

class RadiologyLoading extends RadiologyState {}

class RadiologyLoaded extends RadiologyState {
  final RadiologyResponse radiologyResponse;

  RadiologyLoaded(this.radiologyResponse);
}

class RadiologyFailure extends RadiologyState {
  final String message;
  final int statusCode;
  
  RadiologyFailure(this.message, this.statusCode);
} 