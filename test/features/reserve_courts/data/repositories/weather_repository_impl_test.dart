import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/repositories/weather_repository_impl.dart';

class MockWeatherCloudDataSource extends Mock
    implements WeatherCloudDataSource {}

void main() {
  late MockWeatherCloudDataSource weatherCloudDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;
  setUp(() {
    weatherCloudDataSource = MockWeatherCloudDataSource();
    weatherRepositoryImpl =
        WeatherRepositoryImpl(weatherCloudDataSource: weatherCloudDataSource);
  });

  test('Test request to weather API', () async {
    var resultRequest = await weatherRepositoryImpl.getWeatherFromCloud();
    expect(right(resultRequest), isNotNull);
  });
}
