part of 'reservations_bloc.dart';

abstract class ReservationsEvent extends Equatable {
  ReservationsEvent();

  @override
  List<Object> get props => [];
}

class CreateReservation extends ReservationsEvent {
  final ReservationModel reservationModel;

  CreateReservation({required this.reservationModel});
}

class DeleteReservation extends ReservationsEvent {}

class GetReservations extends ReservationsEvent {
  final List<ReservationModel> reservationsList;

  GetReservations({required this.reservationsList});
}

class ShowModalAlert extends ReservationsEvent {}
