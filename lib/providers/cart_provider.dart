import 'package:farhan_stores/models/productsModel.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get getProductList => _productList;

  void addToCart(Product product) {
    _productList.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    print("Printing Product------");
    _productList.remove(product);
    notifyListeners();
  }
}
