import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationLocalDataSource reservationLocalDataSource;

  ReservationRepositoryImpl({required this.reservationLocalDataSource});

  @override
  Future<Either<Failure, void>> deleteReservations(int id) async =>
      await deleteReservationsFromDatabase(id);

  @override
  Future<Either<Failure, List<Reservations>>> getReservations() async =>
      await getReservationsFromDatabase();

  @override
  Future<Either<Failure, void>> writeReservations(
          Reservations reservations) async =>
      await insertReservationsIntoDatabase(reservations);

  Future<Either<Failure, List<Reservations>>>
      getReservationsFromDatabase() async {
    try {
      return Right(await reservationLocalDataSource.getReservations());
    } on CacheExeptions {
      return Left(CacheExeptions());
    }
  }

  Future<Either<Failure, void>> insertReservationsIntoDatabase(
      Reservations reservations) async {
    try {
      return Right(
          await reservationLocalDataSource.writeReservations(reservations));
    } on CacheExeptions {
      return Left(CacheExeptions());
    }
  }

  Future<Either<Failure, void>> deleteReservationsFromDatabase(int id) async {
    try {
      return Right(await reservationLocalDataSource.deleteReservations(id));
    } on CacheExeptions {
      return Left(CacheExeptions());
    }
  }
}
