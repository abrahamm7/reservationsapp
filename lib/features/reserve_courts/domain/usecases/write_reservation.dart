import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservationsapp/core/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';

class WriteReservation {
  final ReservationRepository reservationRepository;

  WriteReservation(this.reservationRepository);

  Future<Either<Failure, String>> execute(
      {required String nameCourt,
      required String userName,
      required DateTime dateReservation,
      required double precipitationPercentage}) async {
    return await reservationRepository.writeReservations(
        userName, nameCourt, dateReservation, precipitationPercentage);
  }
}
