import 'dart:convert';

import 'package:reservationsapp/core/helpers/api_request.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherCloudDataSource {
  Future<WeatherModel> getWeatherFromCloud();
}

class WeatherCloudDataSourceImpl extends WeatherCloudDataSource {
  @override
  Future<WeatherModel> getWeatherFromCloud() async {
    return await getWeatherData();
  }

  Future<WeatherModel> getWeatherData() async {
    http.Response response =
        await http.get(Uri.parse(ApiRequest.requestWeather), headers: {});

    if (response.statusCode == 200) {
      var weather = WeatherModel.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      throw Exception('Error while fetch data');
    }
  }
}
