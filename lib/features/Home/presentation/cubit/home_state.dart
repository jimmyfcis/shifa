import 'package:shifa/features/Home/data/models/top_doctors_response.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final TopDoctorsResponse topDoctorsResponse;

  HomeLoaded(this.topDoctorsResponse);
}

class HomeFailure extends HomeState {
  final String message;
  final int statusCode;
  HomeFailure(this.message, this.statusCode);
}
