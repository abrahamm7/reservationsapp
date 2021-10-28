import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationLocalDataSource reservationLocalDataSource;

  ReservationRepositoryImpl({required this.reservationLocalDataSource});

  @override
  Future<Either<Failure, Type>> deleteReservations() {
    // TODO: implement deleteReservations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Reservations>>> getReservations() {
    // TODO: implement getReservations
    throw UnimplementedError();
  }

  @override
  Future<int> writeReservations(Reservations reservations) async {
    return await reservationLocalDataSource.writeReservations(reservations);
  }
}
