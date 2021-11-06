import 'package:farhan_stores/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> AuthorizeLogin(String title, String password) async {
  final response = await http.post(
    //Uri.parse('https://farhan-stores.herokuapp.com/user/login'),
    Uri.parse('http://192.168.1.7:4000/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'email': "dude@gmail.com", 'password': "asd123"}),
  );

  print(response.body);
  var user;
  if (response.statusCode == 200) {
    Map<String, dynamic> userMap = jsonDecode(response.body);
    user = User.fromJson(userMap);

    return user;
  } else {
    print("error");
    return user;
  }
}
