import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';

class MockWeatherCloudDataSourceImpl extends Mock
    implements WeatherCloudDataSourceImpl {}

void main() {
  late MockWeatherCloudDataSourceImpl weatherCloudDataSource;
  setUp(() {
    weatherCloudDataSource = MockWeatherCloudDataSourceImpl();
  });

  test('Test request to weather API', () async {
    var resultRequest = await weatherCloudDataSource.getWeatherData();
    print(resultRequest.length);
  });
}
