import 'package:farhan_stores/models/productsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var product_name;
var product_id;
double product_price = 0;

Future<bool> PlaceOrder(
  String customerId,
  double subtotal,
  double total,
  List<Product> productList,
) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.7:4000/user-view/placeOrder'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "order": {
        'customerId': "6125d1696eb5a13628199f28",
        'customerName': "Akaam",
        'customerAddress': "Akurana Near Balika",
        'customerPhone': "770161414",
        'subTotal': 2000,
        'total': 2500,
        'products': [
          {"productId": 543, "productName": "Cadbury", "price": 800}
        ]
      }
    }),
  );

  print(product_id);
  print(response);
  if (response.statusCode == 200) {
    print("Order Placed");
    return true;
  } else {
    print("Unable to Purchase Order");
    return false;
  }
}
