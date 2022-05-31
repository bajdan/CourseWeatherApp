import 'package:course_seather_task/models/localization_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOCALE_KEY = 'locale';

class AppLocalization {
  static String locale = 'en';

  static final Map<String, LocalizationModel> _localizations = {
    'en': LocalizationModel(
      textFieldHint: 'Enter city',
      cityButtonText: 'From city',
      locationButtonText: 'From location',
      feelsLikeTitle: 'Feels Like',
      humidityTitle: 'Humidity',
      windTitle: 'Wind',
      pressureTitle: 'Pressure',
      cloudyTitle: 'Cloudiness',
      rainyTitle: 'Rain Fall',
      errorTitle: 'Woops something goes wrong!',
      errorButtonText: 'Return',
      alertTitle: 'No Internet Connection',
      alertBody: 'Would you like to download the latest forecast?',
      alertButtonText: 'Load',
      days: [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ],
    ),
    'ru': LocalizationModel(
      textFieldHint: 'Введите город',
      cityButtonText: 'По городу',
      locationButtonText: 'По локации',
      feelsLikeTitle: 'Ощущается как',
      humidityTitle: 'Влажность',
      windTitle: 'Ветер',
      pressureTitle: 'Давление',
      cloudyTitle: 'Облачность',
      rainyTitle: 'Осадки',
      errorTitle: 'Упс, что-то пошло не так!',
      errorButtonText: 'Вернуться',
      alertTitle: 'Подключение к интернету отсутствует',
      alertBody: 'Желаете загрузить последний прогноз?',
      alertButtonText: 'Загрузить',
      days: [
        'Понедельник',
        'Вторник',
        'Среда',
        'Четверг',
        'Пятница',
        'Субота',
        'Воскресенье',
      ],
    ),
    'ua': LocalizationModel(
      textFieldHint: 'Введіть місто',
      cityButtonText: 'По місту',
      locationButtonText: 'По локації',
      feelsLikeTitle: 'Відчувається як',
      humidityTitle: 'Вологість',
      windTitle: 'Вітер',
      pressureTitle: 'Тиск',
      cloudyTitle: 'Хмарність',
      rainyTitle: 'Опади',
      errorTitle: 'Упс, щось пішло не так!',
      errorButtonText: 'Повернутись',
      alertTitle: 'Підключення до Інтернету відсутнє',
      alertBody: 'Бажаєте завантажити останній прогноз?',
      alertButtonText: 'Завантажити',
      days: [
        'Понеділок',
        'Вівторок',
        'Середа',
        'Четверг',
        'П\'ятниця',
        'Субота',
        'Неділя',
      ],
    ),
  };

  static LocalizationModel appLocalization() {
    return _localizations[locale]!;
  }

  static Future<String> initLocalization() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    locale = sharedPreferences.getString(LOCALE_KEY)??'en';

    return locale;
  }

  static Future<void> setLocalization(String loc) async{
    locale = loc;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(LOCALE_KEY, locale);
  }
}
