import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

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
}
