import 'dart:developer';

import 'package:course_seather_task/repository/weather_repository.dart';
import 'package:course_seather_task/screens/landing_screen/cubit/initial_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenCubit extends Cubit<LandingState> {
  IWeatherRepository weatherRepository;

  LandingScreenCubit({required this.weatherRepository})
      : super(LandingLoadingState());

  void getForecastByCity(String cityName) async {
    emit(LandingLoadingState());
    try {
      await weatherRepository.loadForecastByCityName(cityName);
      emit(LandingLoadedState(
        totalForecast: weatherRepository.totalForecast,
      ));
    } catch (e) {
      log('Error: $e');
      print(e);
      emit(LandingErrorState());
    }
  }

  void getForecastByLocation() async {
    emit(LandingLoadingState());
    try {
      await weatherRepository.loadForecastByLocation();
      emit(LandingLoadedState(
        totalForecast: weatherRepository.totalForecast,
      ));
    } catch (e) {
      log('Error: $e');
      print(e);
      emit(LandingErrorState());
    }
  }

  void getCachedForecast() async{
    emit(LandingLoadingState());
    try {
      await weatherRepository.loadCachedForecast();
      emit(LandingLoadedState(
        totalForecast: weatherRepository.totalForecast,
      ));
    } catch (e) {
      log('Error: $e');
      print(e);
      emit(LandingErrorState());
    }
  }
}
