import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Reservations extends Equatable {
  late final String? nameCourts;
  final String? userName;
  final String? dateReservation;
  final String? precipitationPercentage;

  Reservations(
      {required this.nameCourts,
      required this.userName,
      required this.dateReservation,
      required this.precipitationPercentage})
      : super([nameCourts, userName, dateReservation, precipitationPercentage]);
}
