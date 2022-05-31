import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:course_seather_task/repository/weather_repository.dart';
import 'package:course_seather_task/screens/landing_screen/landing_screen.dart';
import 'package:course_seather_task/util/app_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  final IWeatherRepository weatherRepository;

  const InitialScreen({required this.weatherRepository, Key? key})
      : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late TextEditingController _controller;
  late StreamSubscription _connectivitySubscription;
  late String locale = AppLocalization.locale;

  @override
  void initState() {
    _controller = TextEditingController();
    _initLocale();
    _initConnectivityListener();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            const FlareActor('assets/animations/moon_to_sun.flr',
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: 'run'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WeatherApp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText:
                              AppLocalization.appLocalization().textFieldHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: Text(AppLocalization.appLocalization()
                        .cityButtonText
                        .toUpperCase()),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingScreen(
                              isCity: true,
                              isCached: false,
                              cityName: _controller.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      ),
                    child: Text(AppLocalization.appLocalization()
                        .locationButtonText
                        .toUpperCase()),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingScreen(
                            isCity: false,
                            isCached: false,
                            cityName: '',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await AppLocalization.setLocalization('en');
                          setState(() {
                            locale = 'en';
                          });
                        },
                        child: Text(
                          'en',
                          style: TextStyle(
                            color: locale == 'en' ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AppLocalization.setLocalization('ua');
                          setState(() {
                            locale = 'ua';
                          });
                        },
                        child: Text(
                          'ua',
                          style: TextStyle(
                            color: locale == 'ua' ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async{
                          await AppLocalization.setLocalization('ru');
                          setState(() {
                            locale = 'ru';
                          });
                        },
                        child: Text(
                          'ru',
                          style: TextStyle(
                            color: locale == 'ru' ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initConnectivityListener() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        bool hasCachedData = await widget.weatherRepository.hasCachedData();
        if (hasCachedData) {
          _showDialog();
        }
      }
    });
  }

  void _initLocale() async {
    String loc = await AppLocalization.initLocalization();
    setState(() {
      locale = loc;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(AppLocalization.appLocalization().alertTitle),
              content: Text(AppLocalization.appLocalization().alertBody),
              actions: [
                TextButton(
                    onPressed: () async {
                      await widget.weatherRepository.loadCachedForecast();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingScreen(
                            isCity: false,
                            isCached: true,
                            cityName: '',
                          ),
                        ),
                      );
                    },
                    child: Text(AppLocalization.appLocalization().alertButtonText)),
              ],
            ));
  }
}
