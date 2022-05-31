import 'package:course_seather_task/models/feels_like.dart';
import 'package:course_seather_task/models/temp.dart';
import 'package:course_seather_task/models/weather.dart';

class DailyForecast {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  List<Weather> weather;
  num speed;
  num deg;

  num gust;
  num clouds;
  num pop;
  num rain;

  DailyForecast(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.weather,
      required this.speed,
      required this.deg,
      required this.gust,
      required this.clouds,
      required this.pop,
      required this.rain});

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    List<Weather> wthr = [];
    if (json['weather'] != null) {
      wthr = <Weather>[];
      json['weather'].forEach((v) {
        wthr.add(Weather.fromJson(v));
      });
    }

    return DailyForecast(
      dt: json['dt'] ?? 0,
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
      temp: Temp.fromJson(json['temp'] ?? {}),
      feelsLike: FeelsLike.fromJson(json['feels_like'] ?? {}),
      pressure: json['pressure'] ?? 0,
      humidity: json['humidity'] ?? 0,
      weather: wthr,
      speed: json['speed'] ?? 0.0,
      deg: json['deg'] ?? 0.0,
      gust: json['gust'] ?? 0.0,
      clouds: json['clouds'] ?? 0.0,
      pop: json['pop'] ?? 0.0,
      rain: json['rain'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp.toJson();
    data['feels_like'] = feelsLike.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    return data;
  }
}
