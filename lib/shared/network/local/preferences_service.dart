import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static sharedInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveUID({required String uid}) async {
    return await sharedPreferences.setString("UID", uid);
  }

  String? getUID() {
    return sharedPreferences.getString("UID");
  }

  Future<bool> putBool({required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> deleteUID() async {
    return await sharedPreferences.remove("UID");
  }
}
