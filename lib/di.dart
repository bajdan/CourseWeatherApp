import 'package:course_seather_task/managers/api_manager.dart';
import 'package:course_seather_task/managers/settings_manager.dart';
import 'package:course_seather_task/managers/shared_prefs_manager.dart';
import 'package:course_seather_task/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DI extends StatelessWidget {
  const DI({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IApiManager>(
          create: (context) => ApiManager(),
        ),
        RepositoryProvider<ISettingsManager>(
          create: (context) => SettingsManager(),
        ),
        RepositoryProvider<ISharedPrefsManager>(
          create: (context) => SharedPrefsManager(),
        ),
        RepositoryProvider<IWeatherRepository>(
          create: (context) => WeatherRepository(
            apiManager: context.read<IApiManager>(),
            sharedPrefsManager: context.read<ISharedPrefsManager>()
          ),
        ),
      ],
      child: child,
    );
  }
}
