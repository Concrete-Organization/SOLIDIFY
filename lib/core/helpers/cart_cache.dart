import 'dart:convert';
import 'package:solidify/core/helpers/shared_pref_helper.dart';

class CartCache {
  static const String _cartItemsKey = 'cartItems';

  /// Adds a product id to the cached list.
  static Future<void> addCartItem(String productId) async {
    // Retrieve the stored list as a JSON string.
    final data = await SharedPrefHelper.getString(_cartItemsKey);
    List<String> items = [];
    if (data.isNotEmpty) {
      try {
        items = List<String>.from(json.decode(data));
      } catch (e) {
        items = [];
      }
    }
    items.add(productId);
    // Save the updated list back as a JSON string.
    await SharedPrefHelper.setData(_cartItemsKey, json.encode(items));
  }

  /// Returns the list of cached product IDs.
  static Future<List<String>> getCartItems() async {
    final data = await SharedPrefHelper.getString(_cartItemsKey);
    if (data.isEmpty) return [];
    try {
      return List<String>.from(json.decode(data));
    } catch (e) {
      return [];
    }
  }

  /// Clears the cached cart items.
  static Future<void> clearCart() async {
    await SharedPrefHelper.removeData(_cartItemsKey);
  }
}
