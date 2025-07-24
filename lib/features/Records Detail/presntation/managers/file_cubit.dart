import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';
import 'package:shifa/features/Records%20Detail/domain/use_cases/file_use_case.dart';
import 'package:shifa/features/Records%20Detail/presntation/managers/file_state.dart';
import '../../../../core/error/error_handler.dart';

class FileCubit extends Cubit<FileState> {
  final GetFileUseCase getFileUseCase;

  FileCubit({required this.getFileUseCase}) : super(FileInitial());

  Future<void> getFileDetails({required bool isLab, required String fileIdentifier}) async{
    emit(FileLoading());
    try {
      final FileResponseModel response = await getFileUseCase(isLab: isLab,fileIdentifier: fileIdentifier);
      emit(FileLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(FileError(failure.message, failure.statusCode ?? 0));
    }
  }
}