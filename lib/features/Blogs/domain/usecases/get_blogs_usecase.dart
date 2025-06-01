import 'package:shifa/features/Blogs/data/models/blog_model.dart';
import 'package:shifa/features/Blogs/domain/repositories/blogs_repository.dart';

class GetBlogsUseCase {
  final BlogsRepository repository;

  GetBlogsUseCase(this.repository);

  Future<BlogsResponse> call() {
    return repository.getBlogs();
  }
} 