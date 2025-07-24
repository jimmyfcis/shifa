import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';

abstract class FileRepository {
  Future<FileResponseModel> getFileDetails({required bool isLab, required String fileIdentifier});
}
