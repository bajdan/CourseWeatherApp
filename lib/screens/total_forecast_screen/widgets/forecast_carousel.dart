import 'package:auto_size_text/auto_size_text.dart';
import 'package:course_seather_task/models/daily_forecast.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/day_plate.dart';
import 'package:flutter/material.dart';

class ForecastCarousel extends StatelessWidget {
  final void Function(int) callback;
  final int selectedIndex;
  final List<DailyForecast> dailyForecasts;
  final AutoSizeGroup tempGroup;
  final AutoSizeGroup dayGroup;


  const ForecastCarousel(
      {required this.callback,
        required this.selectedIndex,
        required this.dailyForecasts,
        required this.tempGroup,
        required this.dayGroup,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DayPlate(
          callback: callback,
          selectedIndex: selectedIndex,
          currentIndex: 0,
          dailyForecast: dailyForecasts[0],
        ),
        DayPlate(
          callback: callback,
          selectedIndex: selectedIndex,
          currentIndex: 1,
          dailyForecast: dailyForecasts[1],
        ),
        DayPlate(
          callback: callback,
          selectedIndex: selectedIndex,
          currentIndex: 2,
          dailyForecast: dailyForecasts[2],
        ),
        DayPlate(
          callback: callback,
          selectedIndex: selectedIndex,
          currentIndex: 3,
          dailyForecast: dailyForecasts[3],
        ),
        DayPlate(
          callback: callback,
          selectedIndex: selectedIndex,
          currentIndex: 4,
          dailyForecast: dailyForecasts[4],
        ),
      ],
    );
  }
}