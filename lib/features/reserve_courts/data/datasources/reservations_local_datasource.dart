import 'package:reservationsapp/core/helpers/database_manager.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:sqflite/sqflite.dart';

abstract class ReservationLocalDataSource {
  Future<List<ReservationModel>> getReservations();
  Future<void> writeReservations(ReservationModel reservationModel);
  Future<void> deleteReservations(int id);
}

class ReservationLocalDataSourceImpl implements ReservationLocalDataSource {
  @override
  Future<List<ReservationModel>> getReservations() async =>
      await getReservationsFromLocalStorage();

  @override
  Future<void> writeReservations(ReservationModel reservations) async =>
      await insertReservationsIntoLocalStorage(reservations);

  @override
  Future<void> deleteReservations(int id) async =>
      await deleteReservationsFromLocalStorage(id);

  Future<List<ReservationModel>> getReservationsFromLocalStorage() async {
    Database? _db;
    _db = await DBHelper().initDb();
    var dbClient = _db;
    var list = await dbClient?.query('Reservations');
    List<ReservationModel> reservationsList = [];

    list?.forEach((result) {
      ReservationModel reservations = ReservationModel.fromDbMap(result);
      reservationsList.add(reservations);
    });
    return reservationsList;
  }
}

Future<void> insertReservationsIntoLocalStorage(
    Reservations reservations) async {
  Database? _db;
  _db = await DBHelper().initDb();
  var dbClient = _db;
  var reservationModel = reservations as ReservationModel;
  await dbClient?.insert("Reservations", reservationModel.toDbMap());
}

Future<void> deleteReservationsFromLocalStorage(int id) async {
  Database? _db;
  _db = await DBHelper().initDb();
  var dbClient = _db;
  dbClient?.rawDelete("DELETE FROM Reservations WHERE id = $id");
}
