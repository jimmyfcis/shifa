import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Blogs/domain/usecases/get_blogs_usecase.dart';
import 'blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  final GetBlogsUseCase getBlogsUseCase;

  BlogsCubit({required this.getBlogsUseCase}) : super(BlogsInitial());

  Future<void> getBlogs({required bool isHome}) async {
    try {
      emit(BlogsLoading());
      final response = await getBlogsUseCase(isHome:isHome);
      emit(BlogsLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(BlogsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 