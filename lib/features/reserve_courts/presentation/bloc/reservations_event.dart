part of 'reservations_bloc.dart';

abstract class ReservationsEvent extends Equatable {
  ReservationsEvent();

  @override
  List<Object> get props => [];
}

class CreateReservation extends ReservationsEvent {
  final ReservationModel reservationModel;

  CreateReservation(this.reservationModel);
}

class DeleteReservation extends ReservationsEvent {}

class GetReservations extends ReservationsEvent {}

class ShowModalAlert extends ReservationsEvent {}
