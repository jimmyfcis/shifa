import '../../../data/models/records_response_model.dart';
abstract class RecordsState {}

class RecordsInitial extends RecordsState {}

class RecordsLoading extends RecordsState {}

class RecordsLoaded extends RecordsState {
  final RecordsResponseModel recordsResponseModel;

  RecordsLoaded(this.recordsResponseModel);
}

class RecordsFailure extends RecordsState {
  final String message;
  final int statusCode;

  RecordsFailure(this.message, this.statusCode);
}