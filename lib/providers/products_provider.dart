import 'package:farhan_stores/models/productsModel.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  dynamic _allProducts;

  List<Product> get getAllProducts => _allProducts;

  void storeProducts(List<Product> allProducts) {
    _allProducts = allProducts;
  }
}
