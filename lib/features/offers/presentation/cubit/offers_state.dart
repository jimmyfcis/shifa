import '../../data/models/offers_model.dart';

abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final OffersResponseModel offersResponseModel;

  OffersLoaded(this.offersResponseModel);
}

class OffersFailure extends OffersState {
  final String message;
  final int statusCode;

  OffersFailure(this.message, this.statusCode);
} 