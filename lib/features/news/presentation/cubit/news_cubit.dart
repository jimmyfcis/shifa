import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import '../../domain/usecases/get_news_usecase.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsCubit({required this.getNewsUseCase}) : super(NewsInitial());

  Future<void> getNews({required bool isLeksell}) async {
    try {
      emit(NewsLoading());
      final response = await getNewsUseCase(isLeksell: isLeksell);
      emit(NewsLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(NewsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 