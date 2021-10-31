import 'package:farhan_stores/providers/shopping_cart_provider.dart';
import 'package:farhan_stores/screens/home.dart';
import 'package:farhan_stores/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ShoppingCartProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: LoginIn()));
  }
}
