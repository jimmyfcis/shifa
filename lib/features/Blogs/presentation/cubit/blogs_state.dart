import 'package:shifa/features/Blogs/data/models/blog_model.dart';

abstract class BlogsState {}

class BlogsInitial extends BlogsState {}

class BlogsLoading extends BlogsState {}

class BlogsLoaded extends BlogsState {
  final BlogsResponse blogsResponse;

  BlogsLoaded(this.blogsResponse);
}

class BlogsFailure extends BlogsState {
  final String message;
  final int statusCode;

  BlogsFailure(this.message, this.statusCode);
} 