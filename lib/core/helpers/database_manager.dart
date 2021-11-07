import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final _dbName = "Reservations.db";
  // Use this class as a singleton
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();
  static late Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // Instantiate the database only when it's not been initialized yet.
    _database = await _initDatabase();
    return _database;
  }

  // Creates and opens the database.
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Creates the database structure
  Future _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
          CREATE TABLE Reservation_Tbl (
            ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            nameCourts TEXT NOT NULL,
            userName TEXT,
            dateReservation DATETIME,
            precipitationPercentage DOUBLE
          )
          ''');
  }
}
