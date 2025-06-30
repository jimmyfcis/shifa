import 'package:shifa/features/news/data/models/news_model.dart';
import 'package:shifa/features/news/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<NewResponseModel> call({required bool isLeksell}) {
    return repository.getNews(isLeksell:isLeksell);
  }
} 