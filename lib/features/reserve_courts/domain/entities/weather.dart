import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  Weather({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;

  Weather.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location extends Equatable {
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

class Current extends Equatable {
  Current({
    required this.condition,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.uv,
  });
  late final Condition condition;
  late final double pressureIn;
  late final int precipMm;
  late final int precipIn;
  late final int uv;

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

class Condition extends Equatable {
  Condition();

  Condition.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
