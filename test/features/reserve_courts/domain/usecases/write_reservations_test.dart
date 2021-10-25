import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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
}
