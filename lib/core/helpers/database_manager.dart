import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "reservation.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Reservations(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nameCourts TEXT, userName TEXT, dateReservation TEXT, precipitationPercentage TEXT )");
    print("Created tables");
  }

  void saveReservations(ReservationModel reservationModel) async {
    var dbClient = await db;
    await dbClient?.insert("Reservations", reservationModel.toDbMap());
  }

  Future<List<ReservationModel>> getReservations() async {
    var dbClient = await db;
    var list = await dbClient?.query('Reservations');
    List<ReservationModel> reservationsList = [];

    list?.forEach((result) {
      ReservationModel reservations = ReservationModel.fromDbMap(result);
      reservationsList.add(reservations);
    });
    print(reservationsList.length);
    return reservationsList;
  }
}
