import 'package:course_seather_task/models/daily_forecast.dart';
import 'package:course_seather_task/util/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DayPlate extends StatelessWidget {
  final void Function(int) callback;
  final int selectedIndex;
  final int currentIndex;
  final DailyForecast dailyForecast;

  const DayPlate(
      {required this.callback,
      required this.selectedIndex,
      required this.currentIndex,
      required this.dailyForecast,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
            color: selectedIndex == currentIndex
                ? Colors.white
                : Colors.transparent,
          ),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  getIcon(
                    dailyForecast.weather.first.description,
                    selectedIndex == currentIndex
                        ? Colors.grey[900]
                        : Colors.white,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${dailyForecast.temp.day}°',
                    style: TextStyle(
                      color: selectedIndex == currentIndex
                          ? Colors.grey[900]
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    AppLocalization.appLocalization().days[DateTime.now().add(Duration(days: currentIndex)).weekday-1],
                    style: TextStyle(
                      color: selectedIndex == currentIndex
                          ? Colors.grey[900]
                          : Colors.white,
                      fontSize: 10
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          callback(currentIndex);
        });
  }

  Widget getIcon(String description, Color? color) {
    if (description.toLowerCase().contains('rain') ||
        description.toLowerCase().contains('дождь')||
        description.toLowerCase().contains('дощ')) {
      return BoxedIcon(
        WeatherIcons.rain,
        color: color,
      );
    } else if (description.toLowerCase().contains('thunder') ||
        description.toLowerCase().contains('гроза')) {
      return BoxedIcon(WeatherIcons.thunderstorm, color: color);
    } else if (description.toLowerCase().contains('cloud') ||
        description.toLowerCase().contains('обла') ||
        description.toLowerCase().contains('пасмурно')||
        description.toLowerCase().contains('хмар')) {
      return BoxedIcon(WeatherIcons.cloud, color: color);
    } else if (description.toLowerCase().contains('snow') ||
        description.toLowerCase().contains('снег')||
        description.toLowerCase().contains('сніг')) {
      return BoxedIcon(WeatherIcons.snow, color: color);
    } else {
      return BoxedIcon(WeatherIcons.day_sunny, color: color);
    }
  }
}
