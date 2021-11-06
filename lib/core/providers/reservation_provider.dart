import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationProvider extends ReservationLocalDataSourceImpl
    with ChangeNotifier {
  late String _userName = "";
  late String _courtName = "";
  late DateTime _reservationDate = DateTime.now();
  late double _precipitationRate = 0;

  ReservationProvider();

  // Map<String, dynamic> toJson() => {
  //       'userName': _userName,
  //       'courtName': _courtName,
  //       'reservationDate': reservationDate,
  //       'precipitationRate': precipitationRate,
  //     };
  // ReservationProvider.fromJson(Map<String, dynamic> json)
  //     : _userName = json['userName'],
  //       _courtName = json['courtName'],
  //       _reservationDate = json['reservationDate'],
  //       _precipitationRate = json['precipitationRate'];

  void createReservation(String username, String courtName, DateTime dateTime,
      double precipitation) {
    var reservation = ReservationModel(
        nameCourts: courtName,
        userName: username,
        dateReservation:
            "${dateTime.day}/ ${dateTime.hour} / ${dateTime.minute}",
        precipitationPercentage: precipitation);
    writeReservations(reservation);
    notifyListeners();
  }

  @override
  Future<void> deleteReservations(int id) {
    // TODO: implement deleteReservations
    throw UnimplementedError();
  }

  @override
  Future<List<ReservationModel>> getReservations() async {
    // TODO: implement getReservations
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return jsonDecode(preferences.getString('reservation'));
  }

  @override
  Future<void> writeReservations(ReservationModel reservationModel) async {
    // TODO: implement writeReservations
    var objectToJson = reservationModel.toJson();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('reservation', jsonEncode(objectToJson));
  }
}
