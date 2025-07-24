import 'package:shifa/features/Records%20Detail/data/data_source/file_remote_data_source.dart';
import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';
import 'package:shifa/features/Records%20Detail/domain/repository/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FileRemoteDataSource remoteDataSource;

  FileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<FileResponseModel> getFileDetails({required bool isLab, required String fileIdentifier}) async {
    final response = await remoteDataSource.getFileDetails(isLab: isLab, fileIdentifier: fileIdentifier);
    return response;
  }
}
