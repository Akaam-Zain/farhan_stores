import 'package:farhan_stores/models/productsModel.dart';
import 'package:flutter/material.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<Product> _cartList = [];

  int get count => _cartList.length;
  List<Product> get cartList => _cartList;

  //Getter for total

  //Getter for Quantity

  void addToCart(Product selectedProduct) {
    _cartList.add(selectedProduct);
    notifyListeners();
    print("increment is called");
  }

  void removeFromCart(String productId) {
    _cartList.removeWhere((item) => item.id == productId);
    notifyListeners();
  }
}
