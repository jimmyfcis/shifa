import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';
import 'package:shifa/features/Records%20Detail/domain/repository/file_repository.dart';

class GetFileUseCase {
  final FileRepository repository;

  GetFileUseCase({required this.repository});

  Future<FileResponseModel> call({required bool isLab, required String fileIdentifier}) async {
    return await repository.getFileDetails(isLab:isLab,fileIdentifier: fileIdentifier);
  }
}