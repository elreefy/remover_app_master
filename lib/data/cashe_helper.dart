import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setBool(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
  //clear bool
  static clearBool({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> setBoolRtl(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolRtl({required String key}) {
    return sharedPreferences.getBool(key);
  }
  //set string
  static Future<bool> setString(
      {required String key, required String value})  {
    return  sharedPreferences.setString(key, value);
  }
  //get dtnamic
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
//clear string
  static Future<bool>  clearString({required String key}) async {
  return await sharedPreferences.remove(key);
}

  static saveToken(String? deviceToken) {
    return sharedPreferences.setString('deviceToken', deviceToken!);
  }

  static getString(String s) {
    return sharedPreferences.getString(s);
  }
}