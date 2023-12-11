abstract class AppPreferencesPort {
  String? getString(String key);
  setString(String key, String value);

  List<String> getStringList(String key);
  setStringList(String key, List<String> value);

  int? getInt(String key);
  setInt(String key, int value);

  bool? getBool(String key);
  setBool(String key, bool value);

  remove(String key);
  Future<void> clear();
}