import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/constants/app_constants.dart';

class SettingsRepository {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  Future<void> setPIN(String pin) async {
    await _secureStorage.write(key: AppConstants.keyPIN, value: pin);
  }
  
  Future<String?> getPIN() async {
    return await _secureStorage.read(key: AppConstants.keyPIN);
  }
  
  Future<void> clearPIN() async {
    await _secureStorage.delete(key: AppConstants.keyPIN);
  }
  
  Future<void> setHODName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyHODName, name);
  }
  
  Future<String> getHODName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyHODName) ?? AppConstants.defaultHODName;
  }
  
  Future<void> setThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.keyThemeMode, isDark);
  }
  
  Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.keyThemeMode) ?? false;
  }
  
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.keyFirstLaunch) ?? true;
  }
  
  Future<void> setFirstLaunchComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.keyFirstLaunch, false);
  }
}
