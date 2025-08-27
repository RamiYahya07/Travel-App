import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/booking/data/repositories/booking_repository.dart';
import 'package:travel_app/features/booking/presentation/viewmodels/post_book_trip/post_book_trip_states.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository repository;

  BookingCubit(this.repository) : super(BookingInitial());

  Future<void> bookTrip({
    required Map<String, String> bookingData,
    required String accessToken,
  }) async {
    emit(BookingLoading());
    try {
      final response = await repository.bookTrip(
        bookingData: bookingData,
        accessToken: accessToken,
      );
      emit(BookingSuccess(response));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}
