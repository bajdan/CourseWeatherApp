import 'package:course_seather_task/di.dart';
import 'package:course_seather_task/repository/weather_repository.dart';
import 'package:course_seather_task/screens/initial_screen/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DI(
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/initial',
        routes: {
          '/initial': (context) => InitialScreen(
                weatherRepository: context.read<IWeatherRepository>(),
              ),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
