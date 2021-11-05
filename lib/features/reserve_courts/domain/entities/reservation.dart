import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Reservations extends Equatable {
  final int id;
  late final String? nameCourts;
  final String? userName;
  final DateTime? dateReservation;
  final double? precipitationPercentage;

  Reservations(
      {required this.id,
      required this.nameCourts,
      required this.userName,
      required this.dateReservation,
      required this.precipitationPercentage})
      : super([nameCourts, userName, dateReservation, precipitationPercentage]);
}
