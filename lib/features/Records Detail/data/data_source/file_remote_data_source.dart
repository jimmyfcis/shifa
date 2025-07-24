import 'package:dio/dio.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'package:shifa/features/Records%20Detail/data/models/file_response_model.dart';
import '../../../../core/network/api_endpoints.dart';

abstract class FileRemoteDataSource {
  Future<FileResponseModel> getFileDetails({required bool isLab,required String fileIdentifier});
}

class FileRemoteDataSourceImpl implements FileRemoteDataSource {
  final Dio dio=DioClient().dio;

  FileRemoteDataSourceImpl();

  @override
  Future<FileResponseModel> getFileDetails({required bool isLab,required String fileIdentifier}) async {
    if (isLab) {
      final response = await dio.post(
          ApiEndpoints.labFile,
          data: {
            "patFinAccount": fileIdentifier
          }
      );
      return FileResponseModel.fromJson(response.data);
    }
    else {
      final response = await dio.post(
          ApiEndpoints.radFile,
          data: {
            "accessionNo": fileIdentifier
          }
      );
      return FileResponseModel.fromJson(response.data);
    }
  }
}