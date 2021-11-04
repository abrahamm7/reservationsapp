import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:sqflite/sqflite.dart';

abstract class ReservationLocalDataSource {
  Future<List<ReservationModel>> getReservations();
  Future<void> writeReservations(Reservations reservationModel);
  Future<void> deleteReservations(int id);
}

class ReservationLocalDataSourceImpl implements ReservationLocalDataSource {
  @override
  Future<List<ReservationModel>> getReservations() async =>
      await getReservationsFromDatabase();

  @override
  Future<void> writeReservations(Reservations reservations) async =>
      await insertReservationsIntoDatabase(reservations);

  @override
  Future<void> deleteReservations(int id) async =>
      await deleteReservationsFromDatabase(id);

  Future<List<ReservationModel>> getReservationsFromDatabase() async {
    return;
  }

  Future<void> insertReservationsIntoDatabase(
      Reservations reservations) async {}

  Future<void> deleteReservationsFromDatabase(int id) async {}
}
