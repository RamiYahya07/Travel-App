import 'package:travel_app/core/utils/secure_storage.dart';
import '../models/trip.dart';
import '../models/trip_details.dart';
import '../services/trip_service.dart';

class TripRepository {
  final TripService service;

  TripRepository(this.service);

  Future<String> _getAccessToken() async {
    final token = await SecureStorage.readToken("access");
    if (token == null) {
      throw Exception("No access token found");
    }
    return token;
  }

  Future<List<TripModel>> fetchTrips({String? category}) async {
    final accessToken = await _getAccessToken();
    return service.getTrips(
      category: category,
      accessToken: accessToken,
    );
  }

  Future<TripDetailsModel> fetchTripDetails({required int tripId}) async {
    final accessToken = await _getAccessToken();
    return service.getTripDetails(
      tripId: tripId,
      accessToken: accessToken,
    );
  }
}
