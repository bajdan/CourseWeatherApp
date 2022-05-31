import 'package:course_seather_task/models/city.dart';
import 'package:course_seather_task/models/daily_forecast.dart';

class TotalForecast {
  City city;
  String cod;
  double message;
  int cnt;
  List<DailyForecast> dailyForecasts;

  TotalForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.dailyForecasts,
  });

  factory TotalForecast.fromJson(Map<String, dynamic> json) {
    List<DailyForecast> lst = [];
    if (json['list'] != null) {
      lst = [];
      json['list'].forEach((v) {
        lst.add(DailyForecast.fromJson(v));
      });
    }

    return TotalForecast(
      city: City.fromJson(json['city']),
      cod: json['cod'] ?? 'error data',
      message: json['message'] ?? 0.0,
      cnt: json['cnt'] ?? 0,
      dailyForecasts: lst,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city.toJson();
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = dailyForecasts.map((v) => v.toJson()).toList();
    return data;
  }
}