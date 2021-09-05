class Product {
  Product(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.productDescription,
      required this.productImage,
      required this.createdAt,
      required this.updatedAt,
      required this.v});
  String id;
  String productName;
  String productPrice;
  String productDescription;
  String productImage;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productDescription: json["product_description"],
        productImage: json["product_image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": productName,
        "product_price": productPrice,
        "product_description": productDescription,
        "product_image": productImage,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
