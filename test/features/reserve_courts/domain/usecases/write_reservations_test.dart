import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/write_reservation.dart';

class MockReservationsRepository extends Mock implements ReservationRepository {
}

void main() {
  late WriteReservation usecase;
  late MockReservationsRepository mockWriteReservations;
  setUp(() {
    mockWriteReservations = MockReservationsRepository();
    usecase = WriteReservation(mockWriteReservations);
  });

  var reservations = Reservations(
      nameCourts: "A",
      userName: "Abraham",
      dateReservation: DateTime.now(),
      precipitationPercentage: 3.5);

  test('Test to reserve courts', () {
    mockWriteReservations.writeReservations(reservations);
  });
}
