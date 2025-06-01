import 'package:shifa/features/Blogs/data/datasources/blogs_remote_data_source.dart';
import 'package:shifa/features/Blogs/data/models/blog_model.dart';
import 'package:shifa/features/Blogs/domain/repositories/blogs_repository.dart';

class BlogsRepositoryImpl implements BlogsRepository {
  final BlogsRemoteDataSource remoteDataSource;

  BlogsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BlogsResponse> getBlogs() async {
    final response = await remoteDataSource.getBlogs();
    return response;
  }
} 