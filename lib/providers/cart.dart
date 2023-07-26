// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity! + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(), title: title, price: price));
    }
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String title;
  final int? quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    this.quantity,
    required this.price,
  });
}
