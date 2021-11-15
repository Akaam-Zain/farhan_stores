import 'package:farhan_stores/providers/products_provider.dart';
import 'package:farhan_stores/providers/shopping_cart_provider.dart';
import 'package:farhan_stores/providers/user_provider.dart';
import 'package:farhan_stores/screens/home.dart';
import 'package:farhan_stores/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
      ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider())
    ],
    child: MyApp(
      token: token,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({Key? key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Color(0xFF707070),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
          ),
        ),
        home: token != '' ? LoginIn() : HomePage()));
  }
}
