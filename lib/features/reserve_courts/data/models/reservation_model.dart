import 'dart:convert';
import 'package:dartz/dartz.dart';
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
      required final String? precipitationPercentage})
      : super(
            nameCourts: nameCourts,
            userName: userName,
            dateReservation: dateReservation,
            precipitationPercentage: precipitationPercentage);

  factory ReservationModel.fromJson(Map<String, dynamic> parsedJson) {
    return ReservationModel(
        //id: parsedJson['id'],
        nameCourts: parsedJson['nameCourts'].toString(),
        userName: parsedJson['userName'].toString(),
        dateReservation: parsedJson['dateReservation'].toString(),
        precipitationPercentage:
            parsedJson['precipitationPercentage'].toString());
  }

  Map<String, dynamic> toJson() => {
        //'id': id,
        'userName': userName,
        'nameCourts': nameCourts,
        'dateReservation': dateReservation,
        'precipitationPercentage': precipitationPercentage,
      };

  factory ReservationModel.fromDbMap(Map<String, dynamic> map) {
    return ReservationModel(
      //id: map["id"],
      nameCourts: map["nameCourts"],
      userName: map["userName"],
      dateReservation: map["dateReservation"],
      precipitationPercentage: map["precipitationPercentage"],
    );
  }

  Map<String, dynamic> toDbMap() {
    return {
      'nameCourts': nameCourts,
      'userName': userName,
      'dateReservation': dateReservation,
      'precipitationPercentage': precipitationPercentage
    };
  }
}
