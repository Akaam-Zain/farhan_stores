class User {
  User(
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
}
