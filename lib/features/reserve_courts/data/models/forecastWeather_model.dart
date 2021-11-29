import 'package:reservationsapp/features/reserve_courts/domain/entities/forecastWeather.dart';

class ForecastWeatherModel extends ForecastWeather {
  ForecastWeatherModel({
    required location,
    required current,
    required forecast,
  }) : super(
          location: location,
          current: current,
          forecast: forecast,
        );

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
        location: LocationModel.fromJson(json['location']),
        current: CurrentModel.fromJson(json['current']),
        forecast: ForecastModel.fromJson(json['forecast']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    _data['forecast'] = forecast.toJson();
    return _data;
  }
}

class LocationModel extends Location {
  LocationModel({
    required name,
    required region,
    required country,
    required lat,
    required lon,
    required tzId,
    required localtimeEpoch,
    required localtime,
  }) : super(
          name: name,
          region: region,
          country: country,
          lat: lat,
          lon: lon,
          tzId: tzId,
          localtimeEpoch: localtimeEpoch,
          localtime: localtime,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        lat: json['lat'],
        lon: json['lon'],
        tzId: json['tz_id'],
        localtimeEpoch: json['localtime_epoch'],
        localtime: json['localtime']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class CurrentModel extends Current {
  CurrentModel({
    required condition,
    required pressureIn,
    required precipMm,
    required precipIn,
    required uv,
  }) : super(
          condition: condition,
          pressureIn: pressureIn,
          precipMm: precipMm,
          precipIn: precipIn,
          uv: uv,
        );

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
        condition: ConditionModel.fromJson(json['condition']),
        pressureIn: json['pressure_in'],
        precipMm: json['precip_mm'],
        precipIn: json['precip_in'],
        uv: json['uv']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['condition'] = condition.toJson();
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['uv'] = uv;
    return _data;
  }
}

class ConditionModel extends Condition {
  ConditionModel();

  ConditionModel.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class ForecastModel extends Forecast {
  ForecastModel({
    required forecastday,
  }) : super(forecastday: forecastday);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        forecastday: List.from(json['forecastday'])
            .map((e) => Forecastday.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecastday'] = forecastday.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ForecastdayModel extends Forecastday {
  ForecastdayModel({
    required date,
    required dateEpoch,
    required day,
    required astro,
    required hour,
  }) : super(
            date: date,
            dateEpoch: dateEpoch,
            day: day,
            astro: astro,
            hour: hour);

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) {
    return ForecastdayModel(
        date: json['date'],
        dateEpoch: json['date_epoch'],
        day: DayModel.fromJson(json['day']),
        astro: AstroModel.fromJson(json['astro']),
        hour: List.from(json['hour']).map((e) => Hour.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['date_epoch'] = dateEpoch;
    _data['day'] = day.toJson();
    _data['astro'] = astro.toJson();
    _data['hour'] = hour.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DayModel extends Day {
  DayModel({
    required maxtempC,
    required maxtempF,
    required mintempC,
    required mintempF,
    required avgtempC,
    required avgtempF,
    required maxwindMph,
    required maxwindKph,
    required totalprecipMm,
    required totalprecipIn,
    required avgvisKm,
    required avgvisMiles,
    required avghumidity,
    required dailyWillItRain,
    required dailyChanceOfRain,
    required dailyWillItSnow,
    required dailyChanceOfSnow,
    required condition,
    required uv,
  }) : super(
          maxtempC: maxtempC,
          maxtempF: maxtempF,
          mintempC: mintempC,
          mintempF: mintempF,
          avgtempC: avgtempC,
          avgtempF: avgtempF,
          maxwindMph: maxwindMph,
          maxwindKph: maxwindKph,
          totalprecipMm: totalprecipMm,
          totalprecipIn: totalprecipIn,
          avgvisKm: avgvisKm,
          avgvisMiles: avgvisMiles,
          avghumidity: avghumidity,
          dailyWillItRain: dailyWillItRain,
          dailyChanceOfRain: dailyChanceOfRain,
          dailyWillItSnow: dailyWillItSnow,
          dailyChanceOfSnow: dailyChanceOfSnow,
          condition: condition,
          uv: uv,
        );

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
        maxtempC: json['maxtemp_c'],
        maxtempF: json['maxtemp_f'],
        mintempC: json['mintemp_c'],
        mintempF: json['mintemp_f'],
        avgtempC: json['avgtemp_c'],
        avgtempF: json['avgtemp_f'],
        maxwindMph: json['maxwind_mph'],
        maxwindKph: json['maxwind_kph'],
        totalprecipMm: json['totalprecip_mm'],
        totalprecipIn: json['totalprecip_in'],
        avgvisKm: json['avgvis_km'],
        avgvisMiles: json['avgvis_miles'],
        avghumidity: json['avghumidity'],
        dailyWillItRain: json['daily_will_it_rain'],
        dailyChanceOfRain: json['daily_chance_of_rain'],
        dailyWillItSnow: json['daily_will_it_snow'],
        dailyChanceOfSnow: json['daily_chance_of_snow'],
        condition: Condition.fromJson(json['condition']),
        uv: json['uv']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maxtemp_c'] = maxtempC;
    _data['maxtemp_f'] = maxtempF;
    _data['mintemp_c'] = mintempC;
    _data['mintemp_f'] = mintempF;
    _data['avgtemp_c'] = avgtempC;
    _data['avgtemp_f'] = avgtempF;
    _data['maxwind_mph'] = maxwindMph;
    _data['maxwind_kph'] = maxwindKph;
    _data['totalprecip_mm'] = totalprecipMm;
    _data['totalprecip_in'] = totalprecipIn;
    _data['avgvis_km'] = avgvisKm;
    _data['avgvis_miles'] = avgvisMiles;
    _data['avghumidity'] = avghumidity;
    _data['daily_will_it_rain'] = dailyWillItRain;
    _data['daily_chance_of_rain'] = dailyChanceOfRain;
    _data['daily_will_it_snow'] = dailyWillItSnow;
    _data['daily_chance_of_snow'] = dailyChanceOfSnow;
    _data['condition'] = condition.toJson();
    _data['uv'] = uv;
    return _data;
  }
}

class AstroModel extends Astro {
  AstroModel({
    required sunrise,
    required sunset,
    required moonrise,
    required moonset,
    required moonPhase,
    required moonIllumination,
  }) : super(
            sunrise: sunrise,
            sunset: sunset,
            moonrise: moonrise,
            moonset: moonset,
            moonPhase: moonPhase,
            moonIllumination: moonIllumination);

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    return AstroModel(
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        moonrise: json['moonrise'],
        moonset: json['moonset'],
        moonPhase: json['moon_phase'],
        moonIllumination: json['moon_illumination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['moon_illumination'] = moonIllumination;
    return _data;
  }
}

class HourModel extends Hour {
  HourModel({
    required condition,
    required humidity,
    required cloud,
    required feelslikeC,
    required feelslikeF,
    required windchillC,
    required windchillF,
    required heatindexC,
    required heatindexF,
    required dewpointC,
    required dewpointF,
    required willItRain,
    required chanceOfRain,
    required willItSnow,
    required chanceOfSnow,
    required visKm,
    required visMiles,
    required gustMph,
    required gustKph,
    required uv,
  }) : super(
            condition: condition,
            humidity: humidity,
            cloud: cloud,
            feelslikeC: feelslikeC,
            feelslikeF: feelslikeF,
            windchillC: windchillC,
            windchillF: windchillF,
            heatindexC: heatindexC,
            heatindexF: heatindexF,
            dewpointC: dewpointC,
            dewpointF: dewpointF,
            willItRain: willItRain,
            chanceOfRain: chanceOfRain,
            willItSnow: willItSnow,
            chanceOfSnow: chanceOfSnow,
            visKm: visKm,
            visMiles: visMiles,
            gustMph: gustMph,
            gustKph: gustKph,
            uv: uv);

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
        condition: ConditionModel.fromJson(json['condition']),
        humidity: json['humidity'],
        cloud: json['cloud'],
        feelslikeC: json['feelslike_c'],
        feelslikeF: json['feelslike_f'],
        windchillC: json['windchill_c'],
        windchillF: json['windchill_f'],
        heatindexC: json['heatindex_c'],
        heatindexF: json['heatindex_f'],
        dewpointC: json['dewpoint_c'],
        dewpointF: json['dewpoint_f'],
        willItRain: json['will_it_rain'],
        chanceOfRain: json['chance_of_rain'],
        willItSnow: json['will_it_snow'],
        chanceOfSnow: json['chance_of_snow'],
        visKm: json['vis_km'],
        visMiles: json['vis_miles'],
        gustMph: json['gust_mph'],
        gustKph: json['gust_kph'],
        uv: json['uv']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['condition'] = condition.toJson();
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['windchill_c'] = windchillC;
    _data['windchill_f'] = windchillF;
    _data['heatindex_c'] = heatindexC;
    _data['heatindex_f'] = heatindexF;
    _data['dewpoint_c'] = dewpointC;
    _data['dewpoint_f'] = dewpointF;
    _data['will_it_rain'] = willItRain;
    _data['chance_of_rain'] = chanceOfRain;
    _data['will_it_snow'] = willItSnow;
    _data['chance_of_snow'] = chanceOfSnow;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    _data['uv'] = uv;
    return _data;
  }
}
