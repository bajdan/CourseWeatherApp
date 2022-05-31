import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String description;
  final int dt;

  const WeatherImage({required this.description, required this.dt, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(dt);
    print(date.hour);

    if (description.toLowerCase().contains('rain') ||
        description.toLowerCase().contains('дождь')||
        description.toLowerCase().contains('дощ')) {
      return const FlareActor('assets/animations/rainfall_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    } else if (description.toLowerCase().contains('thunder') ||
        description.toLowerCase().contains('гроза')) {
      return const FlareActor('assets/animations/thunder_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    } else if (description.toLowerCase().contains('snow') ||
        description.toLowerCase().contains('снег')||
        description.toLowerCase().contains('сніг')) {
      return const FlareActor('assets/animations/snow.flr',
          alignment: Alignment.topCenter, animation: 'run');
    } else if (description.toLowerCase().contains('cloud') ||
        description.toLowerCase().contains('обла') ||
        description.toLowerCase().contains('пасмурно')||
        description.toLowerCase().contains('хмар')) {
      return const FlareActor('assets/animations/clouds_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    } else if (date.hour > 6 && date.hour < 21) {
      return const FlareActor('assets/animations/sun_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    } else {
      return const FlareActor('assets/animations/moon_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }
  }
}
