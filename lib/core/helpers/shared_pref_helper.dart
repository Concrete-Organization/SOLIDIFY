import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefKeys {
  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String expiresOn = 'expiresOn';
  static const String refreshTokenExpiration = 'refreshTokenExpiration';
  static const String role = 'role';
  static const String isLoggedIn = 'isLoggedIn';
}

class SharedPrefHelper {
  // Private constructor to prevent instantiation
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Data with key: $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: All data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper: setData with key: $key and value: $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value as String);
        break;
      case int:
        await sharedPreferences.setInt(key, value as int);
        break;
      case bool:
        await sharedPreferences.setBool(key, value as bool);
        break;
      case double:
        await sharedPreferences.setDouble(key, value as double);
        break;
      default:
        throw UnsupportedError('Unsupported value type: ${value.runtimeType}');
    }
  }

  /// Gets a [bool] value from SharedPreferences with the given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: getBool with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a [double] value from SharedPreferences with the given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: getDouble with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an [int] value from SharedPreferences with the given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: getInt with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a [String] value from SharedPreferences with the given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: getString with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [String] [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage: setSecuredString with key: $key and value: $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a [String] value from FlutterSecureStorage with the given [key].
  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: getSecuredString with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Retrieves the saved email from SharedPreferences
  static Future<String> getEmail() async {
    debugPrint('SharedPrefHelper : Retrieving email');
    return await getString('email');
  }


  /// Removes all keys and values in FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: All secured data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  static Future<String?> getSurveyResult() async {
    debugPrint('SharedPrefHelper : Retrieving survey result');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('surveyResult');
  }

  /// Saves user details in both SharedPreferences and SecureStorage.
  static Future<void> saveUserDetails({
    required String id,
    required String userName,
    required String email,
  }) async {
    await setSecuredString(SharedPrefKeys.userId, id);
    await setSecuredString(SharedPrefKeys.userName, userName);
    await setSecuredString(SharedPrefKeys.email, email);
  }

  /// Gets user details as a map from SecureStorage.
  static Future<Map<String, String>> getUserDetails() async {
    final userId = await getSecuredString(SharedPrefKeys.userId);
    final userName = await getSecuredString(SharedPrefKeys.userName);
    final email = await getSecuredString(SharedPrefKeys.email);

    return {
      'userId': userId,
      'userName': userName,
      'email': email,
    };
  }
}
