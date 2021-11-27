import 'package:equatable/equatable.dart';

class Reservations extends Equatable {
  late final int? id;
  late final String? nameCourts;
  final String? userName;
  final String? dateReservation;
  final String? precipitationPercentage;

  Reservations(
      {this.id,
      required this.nameCourts,
      required this.userName,
      required this.dateReservation,
      required this.precipitationPercentage})
      : super();

  @override
  List<Object?> get props =>
      [id, nameCourts, userName, dateReservation, precipitationPercentage];
}
