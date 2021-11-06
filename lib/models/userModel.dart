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
    required this.id,
    required this.userUsername,
    required this.userEmail,
    required this.userAddress,
    required this.userPhoneNo,
    required this.userImage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userUsername;
  String userEmail;
  String userAddress;
  int userPhoneNo;
  String userImage;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"],
        userUsername: json["user_username"],
        userEmail: json["user_email"],
        userAddress: json["user_address"],
        userPhoneNo: json["user_phone_no"],
        userImage: json["user_image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_username": userUsername,
        "user_email": userEmail,
        "user_address": userAddress,
        "user_phone_no": userPhoneNo,
        "user_image": userImage,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
