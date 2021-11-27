import 'package:reservationsapp/features/reserve_courts/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required location,
    required current,
  }) : super(current: current, location: location);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
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
            localtime: localtime);

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

  @override
  List<Object?> get props => throw UnimplementedError();
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
            uv: uv);

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
        condition: Condition.fromJson(json['condition']),
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

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ConditionModel extends Condition {
  ConditionModel();

  factory ConditionModel.fromJson(Map json) {
    return ConditionModel();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
