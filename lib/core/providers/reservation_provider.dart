import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class ReservationProvider extends ReservationLocalDataSourceImpl
    with ChangeNotifier {
  late String _userName = "";
  late String _courtName = "";
  late DateTime _reservationDate = DateTime.now();
  late double _precipitationRate = 0;
  late double _id = 0;
  final String tblName = "Reservation_Tbl";
  // late Database database = openDatabase(Path());

  ReservationProvider();

  void createReservation(String username, String courtName, DateTime dateTime,
      double precipitation) {
    var reservation = ReservationModel(
        nameCourts: courtName,
        userName: username,
        dateReservation: dateTime.toIso8601String(),
        precipitationPercentage: precipitation);
    writeReservations(reservation);
    notifyListeners();
  }

  @override
  Future<void> deleteReservations(int id) async {
    // TODO: implement deleteReservations
  }

  @override
  Future<List<ReservationModel>> getReservations() async {
    // TODO: implement getReservations
    // Database db = database;
    // List<Map<String, dynamic>> maps = await db.query('Reservation_Tbl');
    // if (maps.isNotEmpty) {
    //   listReservations =
    //       maps.map((map) => ReservationModel.fromDbMap(map)).toList();
    //   return listReservations;
    // } else {
    //   return listReservations;
    // }

    List<ReservationModel> listReservations = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var reservation = jsonDecode(preferences.getString('reservation'));
    var reservationParsed = ReservationModel.fromJson(reservation);
    listReservations.add(reservationParsed);

    return listReservations;
  }

  @override
  Future<void> writeReservations(ReservationModel reservationModel) async {
    // TODO: implement writeReservations
    // Database db = database;
    // db.insert(
    //   tblName,
    //   reservationModel.toDbMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
    var objectToJson = reservationModel.toJson();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('reservation', jsonEncode(objectToJson));
  }
}
