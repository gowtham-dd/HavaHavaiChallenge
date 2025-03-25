import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  void addToCart(Map<String, dynamic> product) {
    _cart.add({
      'title': product['title'],
      'brand': product['brand'],
      'originalPrice': product['originalPrice'] is double
          ? product['originalPrice']
          : double.tryParse(product['originalPrice'].toString()) ?? 0.0,
      'offerPrice': product['offerPrice'] is double
          ? product['offerPrice']
          : double.tryParse(product['offerPrice'].toString()) ?? 0.0,
      'quantity': product['quantity'] ?? 1,
      'thumbnail': product['thumbnail'],
    });
    notifyListeners();
  }

  void updateQuantity(int index, int change) {
    if (index >= 0 && index < _cart.length) {
      _cart[index]['quantity'] += change;

      // Ensure quantity does not go below 1
      if (_cart[index]['quantity'] < 1) {
        _cart.removeAt(index);
      }

      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  double get totalAmount {
    return _cart.fold(0.0, (sum, item) {
      double offerPrice = item['offerPrice'] is double
          ? item['offerPrice']
          : double.tryParse(item['offerPrice'].toString()) ?? 0.0;

      int quantity = item['quantity'] ?? 1;
      return sum + (offerPrice * quantity);
    });
  }

  /// **New getter to calculate total items in the cart**
  int get totalItems {
    return _cart.fold<int>(0, (sum, item) => sum + (item['quantity'] as int));
  }
}
