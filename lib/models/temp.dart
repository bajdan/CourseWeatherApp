class Temp {
  num day;
  num min;
  num max;
  num night;
  num eve;
  num morn;

  Temp(
      {required this.day,
        required this.min,
        required this.max,
        required this.night,
        required this.eve,
        required this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day'] ?? 0.0,
      min: json['min'] ?? 0.0,
      max: json['max'] ?? 0.0,
      night: json['night'] ?? 0.0,
      eve: json['eve'] ?? 0.0,
      morn: json['morn'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}