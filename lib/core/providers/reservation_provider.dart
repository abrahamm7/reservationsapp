import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservationsapp/core/helpers/database_manager.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class ReservationProvider with ChangeNotifier {
  late String _userName = "";
  late String _courtName = "";
  late DateTime _reservationDate = DateTime.now();
  late double _precipitationRate = 0;
  late double _id = 0;

  ReservationProvider();

  void createReservation(String username, String courtName, DateTime dateTime,
      String precipitation) {
    var reservation = ReservationModel(
        nameCourts: courtName,
        userName: username,
        dateReservation: dateTime.toIso8601String(),
        precipitationPercentage: precipitation);
    writeReservations(reservation);
    notifyListeners();
  }

  Future<List<ReservationModel>> getReservations() async {
    ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
        ReservationLocalDataSourceImpl();
    return await reservationLocalDataSourceImpl.getReservations();
  }

  Future<void> writeReservations(ReservationModel reservationModel) async {
    ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
        ReservationLocalDataSourceImpl();
    reservationLocalDataSourceImpl.writeReservations(reservationModel);
  }
}
