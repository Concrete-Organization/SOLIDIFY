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
  static const String isFirstTime = 'isFirstTime';
  static const String productId = 'productId';
  static const String cachedProductIds = 'cachedProductIds';
}

class SharedPrefHelper {
  SharedPrefHelper._();

  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Data with key: $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: All data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

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

  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    debugPrint('SharedPrefHelper: getBool with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: getDouble with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: getInt with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: getString with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage: setSecuredString with key: $key and value: $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: getSecuredString with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<String> getEmail() async {
    debugPrint('SharedPrefHelper : Retrieving email');
    return await getString('email');
  }

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

  static Future<void> saveUserDetails({
    required String id,
    required String userName,
    required String email,
  }) async {
    await setSecuredString(SharedPrefKeys.userId, id);
    await setSecuredString(SharedPrefKeys.userName, userName);
    await setSecuredString(SharedPrefKeys.email, email);
  }

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

  static Future<void> setProductId(String id) async {
    await setData(SharedPrefKeys.productId, id);
    debugPrint("SharedPrefHelper: Product id set to $id");
  }

  static Future<String> getProductId() async {
    debugPrint('SharedPrefHelper: Retrieving product id');
    return await getString(SharedPrefKeys.productId);
  }

  // New methods for caching multiple product IDs
  static Future<void> cacheProductIds(List<String> ids) async {
    final idsString = ids.join(',');
    await setData(SharedPrefKeys.cachedProductIds, idsString);
    debugPrint("SharedPrefHelper: Cached ${ids.length} product IDs");
  }

  static Future<List<String>> getCachedProductIds() async {
    debugPrint('SharedPrefHelper: Retrieving cached product IDs');
    final idsString = await getString(SharedPrefKeys.cachedProductIds);
    if (idsString.isEmpty) {
      return [];
    }
    final List<String> ids = idsString.split(',');
    debugPrint('SharedPrefHelper: Retrieved ${ids.length} cached product IDs');
    return ids;
  }

  static Future<bool> isProductIdCached(String id) async {
    final cachedIds = await getCachedProductIds();
    return cachedIds.contains(id);
  }

  static Future<void> clearCachedProductIds() async {
    await removeData(SharedPrefKeys.cachedProductIds);
    debugPrint('SharedPrefHelper: Cleared cached product IDs');
  }
}
