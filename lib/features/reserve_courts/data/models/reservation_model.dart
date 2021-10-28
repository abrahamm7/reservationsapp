import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

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

  factory ReservationModel.fromDbMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map["id"],
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
