import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> SignUpUserHandler(
    String userName, String email, String password, String address) async {
  final response = await http.post(
    Uri.parse('https://farhan-stores.herokuapp.com/user/create_user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'user_username': 'Akaam Zain',
      'user_email ': "akaamzain@hotmail.com",
      'user_password': "asd123",
      'user_image': "https://picsum.photos/200/300",
      "user_address": "419/Akurana",
      "user_phone_no": 0777194455,
      'orders': [
        {'orderId': "12345"}
      ]
    }),
  );

  print(response);

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    var userId = (result['customer']);
    return userId;
  } else {
    print("error");
    return "";
  }
}
