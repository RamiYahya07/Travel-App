import 'package:bloc/bloc.dart';
import 'package:travel_app/features/trips/data/models/trip.dart';
import 'package:travel_app/features/trips/data/repositories/trip_repository.dart';
import 'package:travel_app/features/trips/presentation/viewmodels/get_trips/get_trips_states.dart';


class TripCubit extends Cubit<TripState> {
  final TripRepository repository;

  TripCubit(this.repository) : super(TripInitial());

  Future<void> getTrips({String? category, required String accessToken}) async {
    emit(TripLoading());
    try {
      final List<TripModel> trips = await repository.fetchTrips(category: category,);
      emit(TripLoaded(trips));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }
}
