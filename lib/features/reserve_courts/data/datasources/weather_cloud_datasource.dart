import 'dart:convert';
import 'package:reservationsapp/core/helpers/api_request.dart';
import 'package:http/http.dart' as http;
import 'package:reservationsapp/features/reserve_courts/data/models/forecastWeather_model.dart';

abstract class WeatherCloudDataSource {
  Future<List<ForecastWeatherModel>> getWeatherFromCloud();
}

class WeatherCloudDataSourceImpl extends WeatherCloudDataSource {
  @override
  Future<List<ForecastWeatherModel>> getWeatherFromCloud() async {
    return await getWeatherData();
  }

  Future<List<ForecastWeatherModel>> getWeatherData() async {
    List<ForecastWeatherModel> forecastList = [];
    http.Response response =
        await http.get(Uri.parse(ApiRequest.requestWeather));

    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var forecastWeather = ForecastWeatherModel.fromJson(map);
      forecastList.add(forecastWeather);
      return forecastList;
    } else {
      throw Exception('Error while fetch data');
    }
  }
}
