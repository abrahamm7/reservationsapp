class ForecastWeather {
  ForecastWeather({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final Location location;
  late final Current current;
  late final Forecast forecast;

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']),
        forecast: Forecast.fromJson(json['forecast']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    _data['forecast'] = forecast.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
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

class Current {
  Current({
    required this.condition,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.uv,
  });
  late final Condition condition;
  late final num pressureIn;
  late final num precipMm;
  late final num precipIn;
  late final num uv;

  Current.fromJson(Map<String, dynamic> json) {
    condition = Condition.fromJson(json['condition']);
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    uv = json['uv'];
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

class Condition {
  Condition();

  Condition.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Forecast {
  Forecast({
    required this.forecastday,
  });
  late final List<Forecastday> forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = List.from(json['forecastday'])
        .map((e) => Forecastday.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecastday'] = forecastday.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final String date;
  late final int dateEpoch;
  late final Day day;
  late final Astro astro;
  late final List<Hour> hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e) => Hour.fromJson(e)).toList();
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

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });
  late final num maxtempC;
  late final num maxtempF;
  late final num mintempC;
  late final num mintempF;
  late final num avgtempC;
  late final num avgtempF;
  late final num maxwindMph;
  late final num maxwindKph;
  late final num? totalprecipMm;
  late final num? totalprecipIn;
  late final num avgvisKm;
  late final num avgvisMiles;
  late final num avghumidity;
  late final num dailyWillItRain;
  late final num dailyChanceOfRain;
  late final num dailyWillItSnow;
  late final num dailyChanceOfSnow;
  late final Condition condition;
  late final num uv;

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
    uv = json['uv'];
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

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });
  late final String sunrise;
  late final String sunset;
  late final String moonrise;
  late final String moonset;
  late final String moonPhase;
  late final String moonIllumination;

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
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

class Hour {
  Hour({
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });
  late final Condition condition;
  late final num humidity;
  late final num cloud;
  late final num? feelslikeC;
  late final num? feelslikeF;
  late final num? windchillC;
  late final num? windchillF;
  late final num? heatindexC;
  late final num? heatindexF;
  late final num? dewpointC;
  late final num? dewpointF;
  late final num willItRain;
  late final num chanceOfRain;
  late final num willItSnow;
  late final num chanceOfSnow;
  late final num visKm;
  late final num visMiles;
  late final num? gustMph;
  late final num? gustKph;
  late final num uv;

  Hour.fromJson(Map<String, dynamic> json) {
    condition = Condition.fromJson(json['condition']);
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
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
