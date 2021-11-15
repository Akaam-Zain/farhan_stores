import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.customer,
  });

  Customer customer;

  factory User.fromJson(Map<String, dynamic> json) => User(
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
      };
}

class Customer {
  Customer({
    this.id,
    required this.userUsername,
    required this.userEmail,
    required this.userPassword,
    required this.userAddress,
    required this.userPhoneNo,
    this.userImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Customer.signUp(
      {required this.userUsername,
      required this.userEmail,
      required this.userPassword,
      required this.userAddress,
      this.userPhoneNo,
      this.userImage}) {}

  String? id;
  String userUsername;
  String userEmail;
  String userAddress;
  int? userPhoneNo;
  String? userImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userPassword;
  int? v;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"],
        userUsername: json["user_username"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userAddress: json["user_address"],
        userPhoneNo: json["user_phone_no"],
        userImage: json["user_image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user_username": userUsername,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_image": userImage,
        "user_address": userAddress,
        "user_phone_no": userPhoneNo,
      };
}
