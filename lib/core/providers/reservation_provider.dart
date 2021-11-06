import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';

class ReservationProvider extends ChangeNotifier {
  late String userName = "";
  late int id = 0;
  late String courtName = "";
  late DateTime reservationDate = DateTime.now();
  late double precipitationRate = 2.5;

  void createReservation(String username, int id, String courtname,
      DateTime reservationDateTime, double precipitationRate) async {
    var reservations = ReservationModel(
        id: id,
        nameCourts: courtname,
        userName: userName,
        dateReservation: reservationDateTime,
        precipitationPercentage: precipitationRate);

    print(reservations);
    notifyListeners();
  }
}
