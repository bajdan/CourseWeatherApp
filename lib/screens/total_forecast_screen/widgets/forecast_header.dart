import 'package:course_seather_task/models/daily_forecast.dart';
import 'package:flutter/material.dart';

class ForecastHeader extends StatelessWidget {
  final String cityName;
  final DailyForecast dailyForecast;

  const ForecastHeader(
      {required this.cityName, required this.dailyForecast, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50.0,
        ),
        Text(
          dailyForecast.weather.first.description,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          cityName,
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          '${dailyForecast.temp.min.toInt()}/${dailyForecast.temp.max.toInt()}°',
          style: const TextStyle(color: Colors.white, fontSize: 60),
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}