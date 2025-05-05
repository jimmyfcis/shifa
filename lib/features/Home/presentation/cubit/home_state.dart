import '../../data/models/doctor_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Doctor> doctors;

  HomeLoaded(this.doctors);
}

class HomeFailure extends HomeState {
  final String message;
  final int statusCode;
  HomeFailure(this.message, this.statusCode);
}
