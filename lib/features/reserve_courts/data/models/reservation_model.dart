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
            id: id,
            nameCourts: nameCourts,
            userName: userName,
            dateReservation: dateReservation,
            precipitationPercentage: precipitationPercentage);

  late SharedPreferences preferences;
  List<ReservationModel> reservationsList = [];

  void initialPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  void createReservations(ReservationModel reservationModel) {
    var reservations = ReservationModel(
        id: reservationModel.id,
        nameCourts: reservationModel.nameCourts,
        userName: reservationModel.userName,
        dateReservation: reservationModel.dateReservation,
        precipitationPercentage: reservationModel.precipitationPercentage);
    reservationsList.add(reservations);
  }
}
