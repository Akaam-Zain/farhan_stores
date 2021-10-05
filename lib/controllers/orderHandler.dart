// import 'package:farhan_stores/models/productsModel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProductsHandler {
//   Future<List<Product>> fetchProducts() async {
//     final url = Uri.parse(
//         "https://blooming-bayou-00254.herokuapp.com/user-view/allProducts");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response
//       List<Product> productList;

//       print(json.decode(response.body)['order']);
//       productList = (json.decode(response.body)['order'] as List)
//           .map((map) => Product.fromJson(map))
//           .toList();

//       return productList;
//     } else {
//       // If the server did not return a 200 OK response
//       throw Exception('Failed to load order');
//     }
//   }
// }
