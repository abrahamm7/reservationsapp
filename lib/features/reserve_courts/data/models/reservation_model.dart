import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@JsonSerializable()
class ReservationModel extends Reservations {
  ReservationModel(
      {required final int id,
      required final String? nameCourts,
      required final String? userName,
      required final DateTime? dateReservation,
      required final double? precipitationPercentage})
      : super(
            nameCourts: nameCourts,
            userName: userName,
            dateReservation: dateReservation,
            precipitationPercentage: precipitationPercentage);

  late SharedPreferences preferences;

  void insertPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
