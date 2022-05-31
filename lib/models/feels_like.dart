class FeelsLike {
  num day;
  num night;
  num eve;
  num morn;

  FeelsLike(
      {required this.day,
        required this.night,
        required this.eve,
        required this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'] ?? 0.0,
      night: json['night'] ?? 0.0,
      eve: json['eve'] ?? 0.0,
      morn: json['morn'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}