import 'package:course_seather_task/repository/weather_repository.dart';
import 'package:course_seather_task/screens/landing_screen/cubit/initial_screen_cubit.dart';
import 'package:course_seather_task/screens/landing_screen/cubit/initial_screen_state.dart';
import 'package:course_seather_task/screens/total_forecast_screen/total_forecast_screen.dart';
import 'package:course_seather_task/screens/total_forecast_screen/widgets/forecast_action_buttons.dart';
import 'package:course_seather_task/util/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  final bool isCity;
  final bool isCached;
  final String cityName;

  const LandingScreen(
      {required this.isCity,
      required this.isCached,
      required this.cityName,
      Key? key})
      : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late LandingScreenCubit _cubit;

  @override
  void initState() {
    _cubit = LandingScreenCubit(
        weatherRepository: context.read<IWeatherRepository>());
    if (widget.isCity) {
      _cubit.getForecastByCity(widget.cityName);
    } else if (widget.isCached) {
      _cubit.getCachedForecast();
    } else {
      _cubit.getForecastByLocation();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 41, 44, 1),
      body: SafeArea(
        child: BlocBuilder(
          bloc: _cubit,
          builder: (context, snapshot) {
            if (snapshot is LandingLoadedState) {
              return Stack(
                children: [
                  TotalForecastScreen(
                    totalForecast: snapshot.totalForecast,
                  ),
                  ForecastActionButtons(cubit: _cubit),
                ],
              );
            } else if (snapshot is LandingErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalization.appLocalization().errorTitle,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalization.appLocalization().errorButtonText,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}