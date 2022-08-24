import 'package:shared_preferences/shared_preferences.dart';

class BusinessLogic {
  static Future<bool> register(String name) async {
    if (name.isNotEmpty) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('name', name);
      _prefs.setBool('loggedin', true);
      _prefs.reload();
      return true;
    }
    return false;
  }
}
