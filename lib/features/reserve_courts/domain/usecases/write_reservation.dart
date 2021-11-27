import 'package:equatable/equatable.dart';
import 'package:reservationsapp/core/usecases/usecases.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';

class WriteReservation implements UseCases<Reservations, Params> {
  final ReservationRepository reservationRepository;

  WriteReservation(this.reservationRepository);

  @override
  Future<void> call(Params params) async {
    await reservationRepository.writeReservations(params.reservations);
  }
}

class Params extends Equatable {
  final Reservations reservations;

  Params({required this.reservations}) : super();

  @override
  List<Object?> get props => [reservations];
}
