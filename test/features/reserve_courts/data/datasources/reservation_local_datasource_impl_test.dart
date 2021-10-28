import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ReservationLocalDataSourceImpl datasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    //datasource = ReservationLocalDataSourceImpl(
    //sharedPreferences: mockSharedPreferences);
  });
}
