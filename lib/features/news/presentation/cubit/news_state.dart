import 'package:shifa/features/news/data/models/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewResponseModel newResponseModel;

  NewsLoaded(this.newResponseModel);
}

class NewsFailure extends NewsState {
  final String message;
  final int statusCode;

  NewsFailure(this.message, this.statusCode);
} 