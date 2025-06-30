import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_offers_usecase.dart';
import 'offers_state.dart';
import 'package:shifa/core/error/error_handler.dart';

class OffersCubit extends Cubit<OffersState> {
  final GetOffersUseCase getOffersUseCase;

  OffersCubit({required this.getOffersUseCase}) : super(OffersInitial());

  Future<void> getOffers() async {
    try {
      emit(OffersLoading());
      final response = await getOffersUseCase();
      emit(OffersLoaded(response));
    } catch (error, stacktrace) {
      final failure = ErrorHandler.handle(error, stacktrace);
      emit(OffersFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 