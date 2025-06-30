import '../../data/models/news_model.dart';

abstract class NewsRepository {
  Future<NewResponseModel> getNews({required bool isLeksell});
} 