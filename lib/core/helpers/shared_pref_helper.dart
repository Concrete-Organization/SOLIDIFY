import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';

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
  static const String favoriteProductIds = 'favoriteProductIds';
  static const String likedPostsKey = 'liked_posts';
  static const likedCommentsKey = 'liked_comments';
  static const likedRepliesKey = 'liked_replies';
  static const String _cartItemsKey = 'cartItems';
  static const String favorites = 'favorites';
  static const String joinedDate = 'joinedDate';
  static const String profileImageUrl = 'profileImageUrl';
  static const String selectedShippingAddressId = 'selectedShippingAddressId';
  static const String shippingAddresses = 'shippingAddresses';
  static const String currentOrderId = 'currentOrderId';
  static const String orderHistory = 'orderHistory';
  static const String cachedOrderIds = 'cachedOrderIds';
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
    debugPrint('SharedPrefHelper: Retrieving email');
    return await getString('email');
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: All secured data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  static Future<String?> getSurveyResult() async {
    debugPrint('SharedPrefHelper: Retrieving survey result');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('surveyResult');
  }

  static Future<void> saveUserDetails({
    required String id,
    required String userName,
    required String email,
    String? profileImageUrl,
  }) async {
    await setSecuredString(SharedPrefKeys.userId, id);
    await setSecuredString(SharedPrefKeys.userName, userName);
    await setSecuredString(SharedPrefKeys.email, email);
    if (profileImageUrl != null) {
      await setData(SharedPrefKeys.profileImageUrl, profileImageUrl);
    }
  }

  static Future<Map<String, String>> getUserDetails() async {
    final userId = await getSecuredString(SharedPrefKeys.userId);
    final userName = await getSecuredString(SharedPrefKeys.userName);
    final email = await getSecuredString(SharedPrefKeys.email);
    final profileImageUrl =
        await getSecuredString(SharedPrefKeys.profileImageUrl);
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'profileImageUrl': profileImageUrl,
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

  static Future<void> cacheProductIds(List<String> ids) async {
    final idsString = ids.join(',');
    await setData(SharedPrefKeys.cachedProductIds, idsString);
    debugPrint("SharedPrefHelper: Cached ${ids.length} product IDs");
  }

  static Future<List<String>> getCachedProductIds() async {
    debugPrint('SharedPrefHelper: Retrieving cached product IDs');
    final idsString = await getString(SharedPrefKeys.cachedProductIds);
    if (idsString.isEmpty) return [];
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

  // New methods for caching order IDs
  static Future<void> cacheOrderIds(List<String> ids) async {
    final idsString = json.encode(ids); // Store as JSON to handle UUIDs safely
    await setData(SharedPrefKeys.cachedOrderIds, idsString);
    debugPrint("SharedPrefHelper: Cached ${ids.length} order IDs");
  }

  static Future<List<String>> getCachedOrderIds() async {
    debugPrint('SharedPrefHelper: Retrieving cached order IDs');
    final idsString = await getString(SharedPrefKeys.cachedOrderIds);
    if (idsString.isEmpty) return [];
    try {
      final List<dynamic> decoded = json.decode(idsString);
      final List<String> ids = decoded.cast<String>();
      debugPrint('SharedPrefHelper: Retrieved ${ids.length} cached order IDs');
      return ids;
    } catch (e) {
      debugPrint('SharedPrefHelper: Error decoding cached order IDs: $e');
      return [];
    }
  }

  static Future<void> clearCachedOrderIds() async {
    await removeData(SharedPrefKeys.cachedOrderIds);
    debugPrint('SharedPrefHelper: Cleared cached order IDs');
  }

  static Future<void> updateLikedPosts(Set<int> likedPosts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      SharedPrefKeys.likedPostsKey,
      likedPosts.map((e) => e.toString()).toList(),
    );
  }

  static Future<Set<int>> getLikedPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final likedList = prefs.getStringList(SharedPrefKeys.likedPostsKey) ?? [];
    return likedList.map(int.parse).toSet();
  }

  static Future<void> addLikedPost(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final liked = await getLikedPosts();
    liked.add(postId);
    await prefs.setStringList(
        SharedPrefKeys.likedPostsKey, liked.map((e) => e.toString()).toList());
  }

  static Future<void> removeLikedPost(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final liked = await getLikedPosts();
    liked.remove(postId);
    await prefs.setStringList(
        SharedPrefKeys.likedPostsKey, liked.map((e) => e.toString()).toList());
  }

  static Future<void> addLikedComment(int commentId) async {
    final liked = await getLikedComments();
    liked.add(commentId);
    await updateLikedComments(liked);
  }

  static Future<void> removeLikedComment(int commentId) async {
    final liked = await getLikedComments();
    liked.remove(commentId);
    await updateLikedComments(liked);
  }

  static Future<Set<int>> getLikedComments() async {
    final prefs = await SharedPreferences.getInstance();
    final likedList =
        prefs.getStringList(SharedPrefKeys.likedCommentsKey) ?? [];
    return likedList.map(int.parse).toSet();
  }

  static Future<void> updateLikedComments(Set<int> likedComments) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      SharedPrefKeys.likedCommentsKey,
      likedComments.map((e) => e.toString()).toList(),
    );
  }

  static Future<void> addLikedReply(int replyId) async {
    final liked = await getLikedReplies();
    liked.add(replyId);
    await updateLikedReplies(liked);
  }

  static Future<void> removeLikedReply(int replyId) async {
    final liked = await getLikedReplies();
    liked.remove(replyId);
    await updateLikedReplies(liked);
  }

  static Future<Set<int>> getLikedReplies() async {
    final prefs = await SharedPreferences.getInstance();
    final likedList = prefs.getStringList(SharedPrefKeys.likedRepliesKey) ?? [];
    return likedList.map(int.parse).toSet();
  }

  static Future<void> updateLikedReplies(Set<int> likedReplies) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      SharedPrefKeys.likedRepliesKey,
      likedReplies.map((e) => e.toString()).toList(),
    );
  }

  static Future<void> addCartItem(String productId) async {
    final data = await SharedPrefHelper.getString(SharedPrefKeys._cartItemsKey);
    List<String> items = [];
    if (data.isNotEmpty) {
      try {
        items = List<String>.from(json.decode(data));
      } catch (e) {
        items = [];
      }
    }
    items.add(productId);
    await SharedPrefHelper.setData(
        SharedPrefKeys._cartItemsKey, json.encode(items));
  }

  static Future<List<String>> getCartItems() async {
    final data = await SharedPrefHelper.getString(SharedPrefKeys._cartItemsKey);
    if (data.isEmpty) return [];
    try {
      return List<String>.from(json.decode(data));
    } catch (e) {
      return [];
    }
  }

  static Future<void> clearCart() async {
    await SharedPrefHelper.removeData(SharedPrefKeys._cartItemsKey);
  }

  static Future<void> saveFavorites(List<ProductEntity> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = favorites.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(SharedPrefKeys.favorites, favoritesJson);
    debugPrint('Saved ${favorites.length} favorites with full product data');
  }

  static Future<List<ProductEntity>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(SharedPrefKeys.favorites) ?? [];
    return favoritesJson.map((jsonString) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ProductEntity.fromJson(json);
    }).toList();
  }

  static Future<void> cacheShippingAddressId(String id) async {
    await setData(SharedPrefKeys.selectedShippingAddressId, id);
  }

  static Future<String> getCachedShippingAddressId() async {
    return await getString(SharedPrefKeys.selectedShippingAddressId);
  }

  static Future<void> clearCachedShippingAddressId() async {
    await removeData(SharedPrefKeys.selectedShippingAddressId);
  }

  static Future<void> cacheOrderId(String id) async {
    await setData(SharedPrefKeys.currentOrderId, id);
  }

  static Future<String> getCachedOrderId() async {
    return await getString(SharedPrefKeys.currentOrderId);
  }

  static Future<void> clearCachedOrderId() async {
    await removeData(SharedPrefKeys.currentOrderId);
  }

  static Future<void> saveOrderToHistory(Map<String, dynamic> orderData) async {
    final orders = await getOrderHistory();
    orders.add(orderData);
    await setData(SharedPrefKeys.orderHistory, json.encode(orders));
  }

  static Future<List<Map<String, dynamic>>> getOrderHistory() async {
    final data = await getString(SharedPrefKeys.orderHistory);
    if (data.isEmpty) return [];
    try {
      final List<dynamic> jsonList = json.decode(data);
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }
}
