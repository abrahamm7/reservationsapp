import 'dart:convert';
import 'package:flutter/widgets.dart';
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
}
