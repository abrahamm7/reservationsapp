import 'package:dartz/dartz.dart';
import 'package:reservationsapp/core/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<Reservations>>> getReservations();
  Future<int> writeReservations(Reservations reservations);
  Future<void> deleteReservations();
}
