import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/core/usecases/usecases.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/get_reservations.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/write_reservation.dart';

class MockReservationsRepository extends Mock implements ReservationRepository {
}

void main() {
  late GetReservations usecase;
  late MockReservationsRepository mockGetResevations;
  setUp(() {
    mockGetResevations = MockReservationsRepository();
    usecase = GetReservations(mockGetResevations);
  });

  test('Test to get all courts', () async {
    await usecase(NoParams());
  });
}
