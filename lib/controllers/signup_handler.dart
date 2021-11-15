import 'package:farhan_stores/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> SignUpUserHandler(Customer newCustomer) async {
  print(newCustomer.userEmail);
  final response = await http.post(
    Uri.parse('https://farhan-stores.herokuapp.com/user/create_user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(newCustomer),
  );

  print(response);

  if (response.statusCode == 200) {
    var user = jsonDecode(response.body);

    return user;
  } else {
    print("error");
    return "";
  }
}
