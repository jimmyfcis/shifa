
import '../../../data/models/visit_response.dart';

abstract class VisitState {}

class VisitInitial extends VisitState {}

class VisitLoading extends VisitState {}

class VisitLoaded extends VisitState {
  final VisitResponse visitResponse;

  VisitLoaded(this.visitResponse);
}

class VisitFailure extends VisitState {
  final String message;
  final int statusCode;
  
  VisitFailure(this.message, this.statusCode);
} 