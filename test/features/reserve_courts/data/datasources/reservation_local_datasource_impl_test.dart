import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/core/helpers/database_manager.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {}

@Skip("sqflite cannot run on the machine")
void main() {
  late MockDatabase mockDatabase;
  late ReservationLocalDataSourceImpl datasource;

  setUp(() {
    mockDatabase = MockDatabase();
    datasource = ReservationLocalDataSourceImpl();
  });

  var reservationsModel = ReservationModel(
      nameCourts: "Cancha A",
      userName: "Abraham Morillo",
      dateReservation: "${DateTime.now().toIso8601String()}",
      precipitationPercentage: "3.5 %");

  group('Test some operations from DataBase', () {
    test('Write a reservation by user', () async {
      await datasource.writeReservations(reservationsModel);
    });
    test('Get a list reservations by user', () async {
      var reservationList = await datasource.getReservations();
      expect(reservationList, isNotNull);
    });
  });
}
