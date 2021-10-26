import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationsapp/core/failures.dart';
import 'package:reservationsapp/core/usecases/usecases.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';

class GetReservations implements UseCases<List<Reservations>, NoParams> {
  final ReservationRepository reservationRepository;

  GetReservations(this.reservationRepository);

  @override
  Future<Either<Failure, List<Reservations>>> call(NoParams params) async {
    var listReservations = await reservationRepository.getReservations();
    if (listReservations.length() == 0) {
      NullThrownError();
    }
    return await reservationRepository.getReservations();
  }
}
