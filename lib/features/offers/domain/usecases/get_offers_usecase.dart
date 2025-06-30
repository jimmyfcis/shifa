import '../../data/models/offers_model.dart';
import '../repositories/offers_repository.dart';

class GetOffersUseCase {
  final OffersRepository repository;

  GetOffersUseCase(this.repository);

  Future<OffersResponseModel> call() {
    return repository.getOffers();
  }
} 