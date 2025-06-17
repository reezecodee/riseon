import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  
  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }
  
  // String operations
  Future<bool> setString(String key, String value) async {
    return await _preferences!.setString(key, value);
  }
  
  String? getString(String key) {
    return _preferences!.getString(key);
  }
  
  // Bool operations
  Future<bool> setBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }
  
  bool? getBool(String key) {
    return _preferences!.getBool(key);
  }
  
  // Int operations
  Future<bool> setInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }
  
  int? getInt(String key) {
    return _preferences!.getInt(key);
  }
  
  // Object operations (JSON)
  Future<bool> setObject(String key, Map<String, dynamic> value) async {
    return await _preferences!.setString(key, json.encode(value));
  }
  
  Map<String, dynamic>? getObject(String key) {
    final value = _preferences!.getString(key);
    if (value != null) {
      return json.decode(value);
    }
    return null;
  }
  
  // Remove operations
  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }
  
  Future<bool> clear() async {
    return await _preferences!.clear();
  }
  
  // Check if key exists
  bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }
}