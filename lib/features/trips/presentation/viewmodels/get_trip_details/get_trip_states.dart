import 'package:equatable/equatable.dart';
import 'package:travel_app/features/trips/data/models/trip_details.dart';


abstract class TripDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class TripDetailsInitial extends TripDetailsState {}

class TripDetailsLoading extends TripDetailsState {}

class TripDetailsLoaded extends TripDetailsState {
  final TripDetailsModel tripDetails;

  TripDetailsLoaded(this.tripDetails);

  @override
  List<Object> get props => [tripDetails];
}

class TripDetailsError extends TripDetailsState {
  final String message;

  TripDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
