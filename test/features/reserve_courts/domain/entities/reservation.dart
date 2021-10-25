import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Reservations extends Equatable {
  final String nameCourts;
  final String userName;
  final DateTime dateReservation;
  final Double precipitationPercentage;

  Reservations(
      {required this.nameCourts,
      required this.userName,
      required this.dateReservation,
      required this.precipitationPercentage})
      : super([nameCourts, userName, dateReservation, precipitationPercentage]);
}
