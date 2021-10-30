part of 'reservations_bloc.dart';

abstract class ReservationsState extends Equatable {
  ReservationsState();

  @override
  List<Object> get props => [];
}

class Empty extends ReservationsState {}

class Loading extends ReservationsState {}

class Loaded extends ReservationsState {
  final List<ReservationModel> reservationsCollections;

  Loaded({required this.reservationsCollections});
}

class Error extends ReservationsState {
  final String errorMessage;

  Error({required this.errorMessage});
}
