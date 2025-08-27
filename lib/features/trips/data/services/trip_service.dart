import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/services/api.dart';
import 'package:travel_app/features/trips/data/models/trip.dart';
import 'package:travel_app/features/trips/data/models/trip_details.dart';

class TripService {
  final Api api;

  TripService(this.api);

  Future<List<TripModel>> getTrips({String? category, required String accessToken}) async {
    String url = '$kBaseUrl/trips/';
    if (category != null) {
      url += '?category=$category';
    }

    final response = await api.get(
      url: url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response == null) return [];

    final List tripsList = response as List;
    return tripsList.map((tripJson) => TripModel.fromJson(tripJson)).toList();
  }

  Future<TripDetailsModel> getTripDetails({
    required int tripId,
    required String accessToken,
  }) async {
    final url = '$kBaseUrl/trips/$tripId/';

    final response = await api.get(
      url: url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response == null) {
      throw Exception("Trip details not found");
    }

    return TripDetailsModel.fromJson(response);
  }
}
