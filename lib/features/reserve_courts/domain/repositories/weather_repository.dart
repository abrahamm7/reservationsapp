import 'package:dartz/dartz.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/forecastWeather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<Forecastday>>> getWeatherFromCloud();
}
