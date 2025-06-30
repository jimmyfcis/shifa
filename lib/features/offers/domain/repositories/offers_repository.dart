import '../../data/models/offers_model.dart';

abstract class OffersRepository {
  Future<OffersResponseModel> getOffers();
} 