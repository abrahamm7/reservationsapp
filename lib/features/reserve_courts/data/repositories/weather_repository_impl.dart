import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';
import 'package:reservationsapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/forecastWeather.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherCloudDataSource weatherCloudDataSource;

  WeatherRepositoryImpl({required this.weatherCloudDataSource});

  @override
  Future<Either<Failure, List<Forecastday>>> getWeatherFromCloud() async =>
      await getWeatherDataFromCloud();

  Future<Either<Failure, List<Forecastday>>> getWeatherDataFromCloud() async {
    try {
      return Right(await weatherCloudDataSource.getWeatherFromCloud());
    } on CacheExeptions {
      return Left(CacheExeptions());
    }
  }
}
