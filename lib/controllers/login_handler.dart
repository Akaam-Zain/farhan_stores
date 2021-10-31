import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> AuthorizeLogin(String title, String password) async {
  final response = await http.post(
    Uri.parse('https://farhan-stores.herokuapp.com/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'email': "dude@gmail.com", 'password': "asd123"}),
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
