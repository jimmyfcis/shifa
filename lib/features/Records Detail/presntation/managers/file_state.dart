import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';

abstract class FileState {}

class FileInitial extends FileState {}

class FileLoading extends FileState {}

class FileLoaded extends FileState {
  final FileResponseModel response;

  FileLoaded(this.response);
}

class FileError extends FileState {
  final String message;
  final int statusCode;

  FileError(this.message, this.statusCode);
}
