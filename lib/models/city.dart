import 'package:course_seather_task/models/coord.dart';

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;

  City(
      {required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'error data',
      coord: Coord.fromJson(json['coord']),
      country: json['country'] ?? 'error data',
      population: json['population'] ?? 0,
      timezone: json['timezone'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}