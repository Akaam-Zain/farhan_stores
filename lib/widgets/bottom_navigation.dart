import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, color: Theme.of(context).primaryColor)),
        BottomNavigationBarItem(
          label: "Cart",
          icon:
              Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor),
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
      },
    );
  }
}
