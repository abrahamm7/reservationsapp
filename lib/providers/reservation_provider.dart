import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ReservationProvider with ChangeNotifier {
  late SharedPreferences sharedPreferences;
  late String? nameCourts;
  late String? userName;
  late DateTime? dateReservation;
  late double? precipitationPercentage;

  void insertPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
