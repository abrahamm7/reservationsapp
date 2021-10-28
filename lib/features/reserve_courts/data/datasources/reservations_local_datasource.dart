import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:sqflite/sqflite.dart';

abstract class ReservationLocalDataSource {
  Future<ReservationModel> getReservations();
  Future<int> writeReservations(Reservations reservationModel);
  //Future<ReservationModel> getReservations();
}

class ReservationLocalDataSourceImpl implements ReservationLocalDataSource {
  final Database database;
  final String tblName = "Reservation_Tbl";

  ReservationLocalDataSourceImpl({required this.database});

  @override
  Future<ReservationModel> getReservations() {
    // TODO: implement getReservations
    throw UnimplementedError();
  }

  @override
  Future<int> writeReservations(Reservation reservationModel) {
    // TODO: implement writeReservations
    Database db = database;
    return database.insert(
      tblName,
      reservationModel.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    throw UnimplementedError();
  }
}
