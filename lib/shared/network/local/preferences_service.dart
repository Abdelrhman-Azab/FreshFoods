import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);
  }
}
