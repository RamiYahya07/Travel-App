import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final Map<String, dynamic> bookingResponse;

  BookingSuccess(this.bookingResponse);

  @override
  List<Object?> get props => [bookingResponse];
}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);

  @override
  List<Object?> get props => [message];
}
