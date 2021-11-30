import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/forecastWeather_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/forecastWeather.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  late Location location = Location(
      name: 'santo domingo',
      region: '',
      country: 'Dominican Republic',
      lat: 3,
      lon: 5,
      tzId: '3',
      localtimeEpoch: 2,
      localtime: '8:00');

  late Condition condition = Condition();

  late Current current = Current(
      condition: condition, pressureIn: 3, precipMm: 2, precipIn: 2, uv: 2);

  final forecastWeatherModel = ForecastWeatherModel(
      location: location, current: current, forecast: null);
  final conditionModel = ConditionModel();
  final locationModel = LocationModel(
      name: 'santo Domingo',
      region: 'Distrito Nacional',
      country: 'Dominican Republic',
      lat: 18.47,
      lon: -69.2,
      tzId: 'America/Santo_Domingo',
      localtimeEpoch: 1638278234,
      localtime: '2021-11-30 9:17');

  final currentModel = CurrentModel(
      condition: condition, pressureIn: 3.4, precipMm: 2, precipIn: 2, uv: 2);

  group('Test subclasses', () {
    test('Test subclass weather model', () {
      expect(forecastWeatherModel, isA<ForecastWeather>());
    });
    test('Test subclass condition model', () {
      expect(conditionModel, isA<Condition>());
    });

    test('Test subclass condition model', () {
      expect(locationModel, isA<Location>());
    });

    test('Test subclass condition model', () {
      expect(currentModel, isA<Current>());
    });
  });
}
