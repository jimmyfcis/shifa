import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifa/core/error/error_handler.dart';
import 'package:shifa/features/Booking/domain/usecases/book_appointment_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/book%20appointement/book_appointment_state.dart';
import '../../../data/models/book_appointment_model.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  BookAppointmentCubit({required this.bookAppointmentUseCase}) : super(BookAppointmentInitial());

  Future<void> bookAppointment({required BookAppointmentRequest request}) async {
    emit(BookAppointmentLoading());
    try {
      final response = await bookAppointmentUseCase(request);
      emit(BookAppointmentSuccess(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error);
      emit(BookAppointmentFailure(failure.message, failure.statusCode ?? 0));
    }
  }
} 