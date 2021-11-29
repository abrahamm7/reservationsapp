import 'dart:convert';

import 'package:reservationsapp/core/helpers/api_request.dart';
import 'package:http/http.dart' as http;
import 'package:reservationsapp/features/reserve_courts/domain/entities/forecastWeather.dart';

abstract class WeatherCloudDataSource {
  Future<List<Forecastday>> getWeatherFromCloud();
}

class WeatherCloudDataSourceImpl extends WeatherCloudDataSource {
  @override
  Future<List<Forecastday>> getWeatherFromCloud() async {
    return await getWeatherData();
  }

  Future<List<Forecastday>> getWeatherData() async {
    http.Response response =
        await http.get(Uri.parse(ApiRequest.requestWeather));

    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var forecastWeather = ForecastWeather.fromJson(map);
      var forecastList = forecastWeather.forecast.forecastday;
      print(forecastList.length);
      return forecastList;
    } else {
      throw Exception('Error while fetch data');
    }
  }
}
