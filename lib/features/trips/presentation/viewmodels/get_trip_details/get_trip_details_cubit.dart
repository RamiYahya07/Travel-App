import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/trips/data/repositories/trip_repository.dart';
import 'package:travel_app/features/trips/presentation/viewmodels/get_trip_details/get_trip_states.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final TripRepository repository;

  TripDetailsCubit(this.repository) : super(TripDetailsInitial());

  Future<void> getTripDetails({
    required int tripId,
    required String accessToken,
  }) async {
    emit(TripDetailsLoading());
    try {
      final tripDetails = await repository.fetchTripDetails(
        tripId: tripId,
      );
      emit(TripDetailsLoaded(tripDetails));
    } catch (e) {
      emit(TripDetailsError(e.toString()));
    }
  }
}
