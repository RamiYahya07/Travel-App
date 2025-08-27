import 'package:equatable/equatable.dart';
import 'package:travel_app/features/trips/data/models/trip.dart';

abstract class TripState extends Equatable {
  @override
  List<Object> get props => [];
}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripLoaded extends TripState {
  final List<TripModel> trips;

  TripLoaded(this.trips);

  @override
  List<Object> get props => [trips];
}

class TripError extends TripState {
  final String message;

  TripError(this.message);

  @override
  List<Object> get props => [message];
}
