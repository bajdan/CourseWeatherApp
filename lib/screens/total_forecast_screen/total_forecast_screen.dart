import 'package:auto_size_text/auto_size_text.dart';
import 'package:course_seather_task/models/daily_forecast.dart';
import 'package:course_seather_task/models/total_forecast.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/forecast_carousel.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/forecast_footer.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/forecast_header.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/weather_image.dart';
import 'package:flutter/material.dart';

class TotalForecastScreen extends StatefulWidget {
  final TotalForecast totalForecast;

  const TotalForecastScreen({required this.totalForecast, Key? key})
      : super(key: key);

  @override
  State<TotalForecastScreen> createState() => _TotalForecastScreenState();
}

class _TotalForecastScreenState extends State<TotalForecastScreen> {
  late String cityName;
  late List<DailyForecast> _dailyForecasts;
  late int _currentIndex;

  @override
  void initState() {
    cityName = widget.totalForecast.city.name;
    _dailyForecasts = widget.totalForecast.dailyForecasts;
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherImage(
          description: _dailyForecasts[_currentIndex].weather.first.description,
          dt: _dailyForecasts[_currentIndex].dt,
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ForecastHeader(
              cityName: cityName,
              dailyForecast: _dailyForecasts[_currentIndex],
            ),
            Expanded(child: Container()),
            ForecastCarousel(
              selectedIndex: _currentIndex,
              dailyForecasts: _dailyForecasts,
              tempGroup: AutoSizeGroup(),
              dayGroup: AutoSizeGroup(),
              callback: (index) {
                setState(() {
                  if (index < 0 || index > 4) {
                    _currentIndex = 0;
                  } else {
                    _currentIndex = index;
                  }
                });
              },
            ),
            ForecastFooter(
              dailyForecast: _dailyForecasts[_currentIndex],
              dataGroup: AutoSizeGroup(),
              descGroup: AutoSizeGroup(),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ],
    );
  }
}
