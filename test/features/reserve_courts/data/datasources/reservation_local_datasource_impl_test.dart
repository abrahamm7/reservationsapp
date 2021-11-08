import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late MockDatabase mockDatabase;
  late ReservationLocalDataSourceImpl datasource;

  setUp(() {
    mockDatabase = MockDatabase();
  });

  var reservationsModel = ReservationModel(
      nameCourts: "A",
      userName: "Abraham",
      dateReservation: "${DateTime.now().hour}",
      precipitationPercentage: "3.5");

  test('Insert into database', () async {
    //await datasource.writeReservations(reservationsModel);
  });

  test('Fetch data from database', () async {
    //await datasource.getReservations();
  });
}
