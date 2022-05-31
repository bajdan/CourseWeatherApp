class LocalizationModel {
  final String textFieldHint;
  final String cityButtonText;
  final String locationButtonText;
  final String feelsLikeTitle;
  final String humidityTitle;
  final String windTitle;
  final String pressureTitle;
  final String cloudyTitle;
  final String rainyTitle;
  final String errorTitle;
  final String errorButtonText;
  final String alertTitle;
  final String alertBody;
  final String alertButtonText;
  final List<String> days;

  LocalizationModel({
    required this.textFieldHint,
    required this.cityButtonText,
    required this.locationButtonText,
    required this.feelsLikeTitle,
    required this.humidityTitle,
    required this.windTitle,
    required this.pressureTitle,
    required this.cloudyTitle,
    required this.rainyTitle,
    required this.days,
    required this.errorTitle,
    required this.errorButtonText,
    required this.alertTitle,
    required this.alertBody,
    required this.alertButtonText
  });
}
