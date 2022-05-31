import 'package:auto_size_text/auto_size_text.dart';
import 'package:course_seather_task/models/daily_forecast.dart';
import 'package:course_seather_task/util/app_localization.dart';
import 'package:flutter/material.dart';

class ForecastFooter extends StatelessWidget {
  final DailyForecast dailyForecast;
  final AutoSizeGroup dataGroup;
  final AutoSizeGroup descGroup;

  const ForecastFooter({required this.dailyForecast, required this.dataGroup, required this.descGroup, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DataPlate(
                data: '${dailyForecast.feelsLike.day.toString()}°',
                description: AppLocalization.appLocalization().feelsLikeTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
              DataPlate(
                data: '${dailyForecast.speed.toString()} м/c',
                description: AppLocalization.appLocalization().windTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
              DataPlate(
                data: '${dailyForecast.clouds.toString()}%',
                description: AppLocalization.appLocalization().cloudyTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DataPlate(
                data: '${dailyForecast.humidity}%',
                description: AppLocalization.appLocalization().humidityTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
              DataPlate(
                data: dailyForecast.pressure.toString(),
                description: AppLocalization.appLocalization().pressureTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
              DataPlate(
                data: '${dailyForecast.rain} мм',
                description: AppLocalization.appLocalization().rainyTitle,
                dataGroup: dataGroup,
                descGroup: descGroup,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataPlate extends StatelessWidget {
  final String data;
  final String description;
  final AutoSizeGroup dataGroup;
  final AutoSizeGroup descGroup;

  const DataPlate(
      {required this.data,
      required this.description,
      required this.dataGroup,
      required this.descGroup,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            data,
            style: const TextStyle(color: Colors.white),
            group: dataGroup,
            maxLines: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: AutoSizeText(
              description,
              style: const TextStyle(color: Colors.white),
              group: descGroup,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
