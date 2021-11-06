import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@JsonSerializable()
class ReservationModel extends Reservations {
  ReservationModel(
      {required final String? nameCourts,
      required final String? userName,
      required final String? dateReservation,
      required final double? precipitationPercentage})
      : super(
            nameCourts: nameCourts,
            userName: userName,
            dateReservation: dateReservation,
            precipitationPercentage: precipitationPercentage);

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'nameCourts': nameCourts,
        'dateReservation': dateReservation,
        'precipitationPercentage': precipitationPercentage,
      };
}
