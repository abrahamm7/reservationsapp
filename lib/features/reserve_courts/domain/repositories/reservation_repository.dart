import 'package:dartz/dartz.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<Reservations>>> getReservations();
  Future<Either<Failure, void>> writeReservations(Reservations reservations);
  Future<Either<Failure, void>> deleteReservations(int id);
}
