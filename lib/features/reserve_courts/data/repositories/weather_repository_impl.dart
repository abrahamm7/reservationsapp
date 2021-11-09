import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/weather.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherCloudDataSource weatherCloudDataSource;

  WeatherRepositoryImpl({required this.weatherCloudDataSource});

  @override
  Future<Either<Failure, Weather>> getWeatherFromCloud() async =>
      await getWeatherDataFromCloud();

  Future<Either<Failure, Weather>> getWeatherDataFromCloud() async {
    try {
      return Right(await weatherCloudDataSource.getWeatherFromCloud());
    } on CacheExeptions {
      return Left(CacheExeptions());
    }
  }
}
