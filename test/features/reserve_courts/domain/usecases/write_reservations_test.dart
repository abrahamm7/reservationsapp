import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/write_reservation.dart';

class MockReservationsRepository extends Mock implements ReservationRepository {
}

void main() {
  WriteReservation usecase;
  MockReservationsRepository mockWriteReservations;
  setUp(() {
    mockWriteReservations = MockReservationsRepository();
    usecase = WriteReservation(mockWriteReservations);
  });

  final String nameCourts = "A";
  final String userName = "Abraham";
  final DateTime dateReservation = DateTime.now();
  final double precipitationPercentage = 3.5;

  var reservations = Reservations(
      nameCourts: nameCourts,
      userName: userName,
      dateReservation: dateReservation,
      precipitationPercentage: precipitationPercentage);

  test('Test to reserve courts', () {
    var reserveCourt = mockWriteReservations.writeReservations(
        userName, nameCourts, dateReservation, precipitationPercentage);

    expect(reserveCourt, "inserted");
  });
}
