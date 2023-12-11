import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:visitor_mgnt/out_ports/app_prefs.dart';

class SharedPreferencesAdapter implements AppPreferencesPort {
  final SharedPreferences _sp;

  SharedPreferencesAdapter(this._sp);

  @override
  String? getString(String key) {
    return _sp.getString(key);
  }

  @override
  setString(String key, String value) {
    _sp.setString(key, value);
  }

  @override
  List<String> getStringList(String key) {
    return _sp.getStringList(key) ?? [];
  }

  @override
  setStringList(String key, List<String> value) {
    _sp.setStringList(key, value);
  }

  @override
  bool? getBool(String key) {
    return _sp.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _sp.getInt(key);
  }

  @override
  setBool(String key, bool value) {
    _sp.setBool(key, value);
  }

  @override
  setInt(String key, int value) {
    _sp.setInt(key, value);
  }

  static Future<AppPreferencesPort> diRegistration() async {
    final sp = await SharedPreferences.getInstance();
    final sa = SharedPreferencesAdapter(sp);
    GetIt.I.registerSingleton<AppPreferencesPort>(sa);
    return sa;
  }

  @override
  Future<void> clear() async {
    await _sp.clear();
  }

  @override
  remove(String key) async {
    await _sp.remove(key);
  }
}
