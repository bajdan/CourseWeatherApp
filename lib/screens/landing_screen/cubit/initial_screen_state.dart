import 'package:course_seather_task/models/total_forecast.dart';

abstract class LandingState{}

class LandingLoadingState extends LandingState{}

class LandingLoadedState extends LandingState{
  final TotalForecast totalForecast;

  LandingLoadedState({required this.totalForecast});
}

class LandingErrorState extends LandingState{}