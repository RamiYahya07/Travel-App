import '../services/booking_service.dart';

class BookingRepository {
  final BookingService service;

  BookingRepository(this.service);

  Future<Map<String, dynamic>> bookTrip({
    required Map<String, String> bookingData,
    required String accessToken,
  }) async {
    return await service.bookTrip(
      bookingData: bookingData,
      accessToken: accessToken,
    );
  }
}
