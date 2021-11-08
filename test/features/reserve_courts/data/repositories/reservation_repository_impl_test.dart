import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/data/repositories/reservation_repository_impl.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/write_reservation.dart';

class MockReservationsLocalDataSource extends Mock
    implements ReservationLocalDataSource {}

void main() {
  late MockReservationsLocalDataSource reservationLocalDataSource;
  late ReservationRepositoryImpl reservationRepositoryImpl;
  setUp(() {
    reservationLocalDataSource = MockReservationsLocalDataSource();
    reservationRepositoryImpl = ReservationRepositoryImpl(
        reservationLocalDataSource: reservationLocalDataSource);
  });

  var reservationsModel = ReservationModel(
      nameCourts: "A",
      userName: "Abraham",
      dateReservation: DateTime.now().toIso8601String(),
      precipitationPercentage: "3.5");

  final Reservations reservations = reservationsModel;

  group('Test some operations from DataBase', () {
    test('Write a reservation by user', () async {
      await reservationRepositoryImpl.writeReservations(reservations);
    });
    test('Get a list reservations by user', () async {
      var reservationList = await reservationRepositoryImpl.getReservations();
      expect(right(reservationList), isNotNull);
    });
    test('Delete a reservation by user passing id', () async {
      var reservationList =
          await reservationRepositoryImpl.deleteReservations(1);
    });
  });
}
