import 'package:dartz/dartz.dart';
import 'package:reservationsapp/core/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, Reservations>> getReservations();
  //Future<Either<Failure, String>> writeReservations(Reservations reservations);
  Future<Either<Failure, String>> writeReservations(String userName,
      String nameCourt, DateTime reserveDate, double precipitationPercentage);
  Future<Either<Failure, String>> deleteReservations();
}
