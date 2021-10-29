import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:sqflite/sqflite.dart';

abstract class ReservationLocalDataSource {
  Future<List<ReservationModel>> getReservations();
  Future<int> writeReservations(Reservations reservationModel);
  Future<int> deleteReservations(int id);
}

class ReservationLocalDataSourceImpl implements ReservationLocalDataSource {
  final Database database;
  final String tblName = "Reservation_Tbl";

  ReservationLocalDataSourceImpl({required this.database});

  @override
  Future<List<ReservationModel>> getReservations() async =>
      await getReservationsFromDatabase();

  @override
  Future<int> writeReservations(Reservations reservations) async =>
      await insertReservationsIntoDatabase(reservations);

  @override
  Future<int> deleteReservations(int id) async =>
      await deleteReservationsFromDatabase(id);

  Future<List<ReservationModel>> getReservationsFromDatabase() async {
    List<Map<String, dynamic>> maps = await database.query(tblName);
    if (maps.isNotEmpty) {
      return maps.map((map) => ReservationModel.fromDbMap(map)).toList();
    } else {
      return throw Exception();
    }
  }

  Future<int> insertReservationsIntoDatabase(Reservations reservations) {
    var value = {
      'nameCourts': reservations.nameCourts,
      'userName': reservations.userName,
      'dateReservation': reservations.dateReservation,
      'precipitationPercentage': reservations.precipitationPercentage
    };

    return database.insert(
      tblName,
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteReservationsFromDatabase(int id) {
    return database.delete(
      tblName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
