import 'package:shifa/features/Blogs/data/models/blog_model.dart';

abstract class BlogsRepository {
  Future<BlogsResponse> getBlogs();
} 