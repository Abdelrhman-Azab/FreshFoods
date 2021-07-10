import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static sharedInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> putBool({required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
