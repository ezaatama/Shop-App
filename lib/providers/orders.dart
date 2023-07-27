import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/cart.dart';

class Orders with ChangeNotifier {
  List<ItemOrder> _orders = [];

  List<ItemOrder> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        ItemOrder(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}

class ItemOrder {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  ItemOrder(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}
