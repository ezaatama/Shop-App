import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'P1',
        title: 'Jacket Coach 1',
        description: 'The best of jacket coach 1',
        price: 49.99,
        imageUrl:
            "https://i.pinimg.com/564x/32/ca/86/32ca86e5c58bf762edd5889e22def047.jpg"),
    Product(
        id: 'P2',
        title: 'Jacket Coach 2',
        description: 'The best of jacket coach 2',
        price: 99.99,
        imageUrl:
            "https://i.pinimg.com/564x/24/bd/25/24bd25c447fd64e6964e6bc65d352d07.jpg"),
    Product(
        id: 'P3',
        title: 'Jacket Coach 3',
        description: 'The best of jacket coach 3',
        price: 79.99,
        imageUrl:
            "https://i.pinimg.com/564x/c9/b1/c3/c9b1c3132920f5fd0231930fbcb9b51c.jpg"),
    Product(
        id: 'P4',
        title: 'Jacket Coach 4',
        description: 'The best of jacket coach 4',
        price: 39.99,
        imageUrl:
            "https://i.pinimg.com/564x/8d/d6/14/8dd614fd5db11f0f50bfb1ee62d248a0.jpg"),
  ];

  // var _showOnlyFavorites = false;

  List<Product> get items {
    // if (_showOnlyFavorites) {
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showOnlyFavorites = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showOnlyFavorites = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
