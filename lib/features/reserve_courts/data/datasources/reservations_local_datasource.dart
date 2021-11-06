import 'dart:convert';

import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final SharedPreferences preferences;
    late List<ReservationModel> reservationsList = [];
    return reservationsList;
    // if (preferences.containsKey("reservations") != null &&
    //     preferences.get("reservations") != null) {
    //   return reservationsList = jsonDecode(preferences.get("reservation"));
  }
}

Future<void> insertReservationsIntoLocalStorage(
    Reservations reservations) async {}

Future<void> deleteReservationsFromLocalStorage(int id) async {}
