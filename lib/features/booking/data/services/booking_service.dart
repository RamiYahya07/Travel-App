import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/services/api.dart';

class BookingService {
  final Api api;

  BookingService(this.api);

  Future<Map<String, dynamic>> bookTrip({
    required Map<String, String> bookingData,
    required String accessToken,
  }) async {
    final url = '$kBaseUrl/book-trip/';

    final response = await api.post(
      url: url,
      token:accessToken,
      body: bookingData,
    );

    if (response == null) {
      throw Exception("Booking failed");
    }

    return response as Map<String, dynamic>;
  }
}
