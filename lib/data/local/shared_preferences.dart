import 'package:shared_preferences/shared_preferences.dart';

class Spreferences {
  static SharedPreferences? _preferences;

  static const _startup = 'startup';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setStartup(bool startup) async =>
      await _preferences!.setBool(_startup, startup);

  static bool? getStartup() => _preferences!.getBool(_startup);
}
