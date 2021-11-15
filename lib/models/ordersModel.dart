// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.order,
  });

  Order order;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
      };
}

class Order {
  Order({
    required this.orderId,
    required this.customerId,
    required this.subTotal,
    required this.total,
    required this.products,
  });

  String orderId;
  String customerId;
  int subTotal;
  int total;
  List<Product> products;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["orderId"],
        customerId: json["customerId"],
        subTotal: json["subTotal"],
        total: json["total"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "customerId": customerId,
        "subTotal": subTotal,
        "total": total,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.productId,
    required this.productName,
    required this.price,
  });

  int productId;
  String productName;
  int price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "price": price,
      };
}
