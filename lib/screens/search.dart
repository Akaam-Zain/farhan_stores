import 'package:farhan_stores/models/productsModel.dart';
import 'package:farhan_stores/providers/products_provider.dart';
import 'package:farhan_stores/screens/note.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _products =
        Provider.of<ProductsProvider>(context, listen: false).getAllProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return index == 0 ? _searchBar() : _listItem(index - 1);
      },
      itemCount: _filteredProducts.length + 1,
    ));
  }

  _searchBar() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border:
                    Border.all(color: Colors.transparent), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(30.0)), // set rounded corner radius
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    if (text == "") {
                      setState(() {
                        _filteredProducts.clear();
                      });
                    } else {
                      text = text.toLowerCase();

                      setState(() {
                        _filteredProducts = _products
                            .where((item) =>
                                item.productName.toLowerCase().contains(text))
                            .toList();
                      });
                    }
                  },
                ),
              ),
            )),
      ],
    );
  }

  _listItem(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _filteredProducts[index].productName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _filteredProducts[index].productPrice,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
