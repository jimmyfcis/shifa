import '../datasources/offers_remote_data_source.dart';
import '../../domain/repositories/offers_repository.dart';
import '../models/offers_model.dart';

class OffersRepositoryImpl implements OffersRepository {
  final OffersRemoteDataSource remoteDataSource;

  OffersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OffersResponseModel> getOffers() async {
    final response = await remoteDataSource.getOffers();
    return response;
  }
} 