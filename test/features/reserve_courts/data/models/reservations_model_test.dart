import 'package:flutter_test/flutter_test.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

void main() {
  final reservation = ReservationModel(
      nameCourts: "A",
      userName: "Abraham",
      dateReservation: "${DateTime.now().hour}",
      precipitationPercentage: 3.5);
  test('Test subclass reservation model', () {
    expect(reservation, isA<Reservations>());
  });
}
