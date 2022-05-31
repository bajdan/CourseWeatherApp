import 'package:course_seather_task/managers/shared_prefs_manager.dart';
import 'package:course_seather_task/models/total_forecast.dart';
import 'package:course_seather_task/util/app_localization.dart';
import 'package:geolocator/geolocator.dart';

import '../managers/api_manager.dart';

const String WEATHER_APP_ID = '1369dd6b5ae78fc9952261ab9aa236b4';
const String WEATHER_BASE_SCHEME = 'https://';
const String WEATHER_BASE_URL_DOMAIN = 'api.openweathermap.org';
const String WEATHER_FORECAST_PATH = '/data/2.5/forecast/daily';

abstract class IWeatherRepository {
  TotalForecast get totalForecast;

  Future<void> loadForecastByCityName(String cityName);

  Future<void> loadForecastByLocation();

  Future<void> loadCachedForecast();

  Future<bool> hasCachedData();
}

class WeatherRepository extends IWeatherRepository {
  final IApiManager apiManager;
  final ISharedPrefsManager sharedPrefsManager;
  late TotalForecast _totalForecast;

  WeatherRepository({required this.apiManager, required this.sharedPrefsManager});

  @override
  TotalForecast get totalForecast => _totalForecast;

  @override
  Future<void> loadForecastByCityName(String cityName) async {
    Map<String, String> queryParameters;

    if(AppLocalization.locale=='ua'){
      queryParameters = {
        'APPID': WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
        'lang': 'ua'
      };
    } else if(AppLocalization.locale=='ru'){
      queryParameters = {
        'APPID': WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
        'lang': 'ru'
      };
    } else {
      queryParameters = {
        'APPID': WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
    }



    var uri = Uri.https(
        WEATHER_BASE_URL_DOMAIN, WEATHER_FORECAST_PATH, queryParameters);

    Map<String, dynamic> json = await apiManager.makeRequest(uri);

    _totalForecast = TotalForecast.fromJson(json);

    sharedPrefsManager.saveLastForecast(_totalForecast.toJson());
    sharedPrefsManager.setHasCachedData(true);
  }

  @override
  Future<void> loadForecastByLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(serviceEnabled){
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Map<String, String> queryParameters;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      if(AppLocalization.locale=='ua'){
        queryParameters = {
          'APPID': WEATHER_APP_ID,
          'units': 'metric',
          'lat': position.latitude.toString(),
          'lon': position.longitude.toString(),
          'lang': 'ua'
        };
      } else if(AppLocalization.locale=='ru'){
        queryParameters = {
          'APPID': WEATHER_APP_ID,
          'units': 'metric',
          'lat': position.latitude.toString(),
          'lon': position.longitude.toString(),
          'lang': 'ru'
        };
      } else {
        queryParameters = {
          'APPID': WEATHER_APP_ID,
          'units': 'metric',
          'lat': position.latitude.toString(),
          'lon': position.longitude.toString(),
        };
      }



      var uri = Uri.https(
          WEATHER_BASE_URL_DOMAIN, WEATHER_FORECAST_PATH, queryParameters);

      Map<String, dynamic> json = await apiManager.makeRequest(uri);

      _totalForecast = TotalForecast.fromJson(json);

      sharedPrefsManager.saveLastForecast(_totalForecast.toJson());
      sharedPrefsManager.setHasCachedData(true);
    }else{
      throw Exception('Location service disabled');
    }
  }

  @override
  Future<void> loadCachedForecast() async{
    _totalForecast = TotalForecast.fromJson(await sharedPrefsManager.getLastForecast());
  }

  @override
  Future<bool> hasCachedData() {
    return sharedPrefsManager.hasCachedData();
  }
}
