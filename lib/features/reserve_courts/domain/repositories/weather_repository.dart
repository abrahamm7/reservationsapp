import 'package:dartz/dartz.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherFromCloud();
}
