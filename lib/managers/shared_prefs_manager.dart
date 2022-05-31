import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String FORECAST_KEY = 'forecast_key';
const String IS_FORECAST_SAVED = 'is_forecast_saved';

abstract class ISharedPrefsManager{
  void saveLastForecast(Map<String, dynamic> data);

  Future<Map<String ,dynamic>> getLastForecast();

  void setHasCachedData(bool isSaved);

  Future<bool> hasCachedData();
}

class SharedPrefsManager extends ISharedPrefsManager{
  @override
  Future<Map<String ,dynamic>> getLastForecast() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return jsonDecode(sharedPreferences.getString(FORECAST_KEY)??'');
  }

  @override
  void saveLastForecast(Map<String, dynamic> data) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(FORECAST_KEY, jsonEncode(data));
  }

  @override
  Future<bool> hasCachedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(IS_FORECAST_SAVED)??false;
  }

  @override
  void setHasCachedData(bool isSaved) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool(IS_FORECAST_SAVED, isSaved);
  }
}