import 'package:shifa/features/Blogs/domain/repositories/blogs_repository.dart';
import 'package:shifa/features/news/data/datasources/news_remote_data_source.dart';

import '../../domain/repositories/news_repository.dart';
import '../models/news_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewResponseModel> getNews({required bool isLeksell}) async {
    final response = await remoteDataSource.getNews(isLeksell: isLeksell);
    return response;
  }
} 