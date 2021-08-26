import 'package:farhan_stores/screens/shopping_cart.dart';
import 'package:farhan_stores/widgets/bottom_navigation.dart';
import 'package:farhan_stores/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> navTabs = <Widget>[
    HomeWidget(),
    ShoppingCart(),
    ShoppingCart(),
    ShoppingCart(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {},
          ),
          title: Text(
            "Farhan Stores",
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            fixedColor: Theme.of(context).primaryColor,
            items: [
              BottomNavigationBarItem(
                  label: "Home",
                  icon:
                      Icon(Icons.home, color: Theme.of(context).primaryColor)),
              BottomNavigationBarItem(
                label: "Cart",
                icon: Icon(Icons.shopping_cart,
                    color: Theme.of(context).primaryColor),
              ),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
        body: navTabs[_currentIndex]);
  }
}
