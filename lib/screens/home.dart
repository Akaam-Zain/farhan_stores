import 'package:farhan_stores/controllers/controllers.dart';
import 'package:farhan_stores/models/productsModel.dart';

import 'screens.dart';
import 'package:farhan_stores/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static get productsHandler => new ProductsHandler();
  List<Future<Product>> products = [];

  @override
  void initState() {
    // TODO: implement initState
    productsHandler.fetchProducts();

    productsHandler.fetchProducts().then((data) {
      setState(() {
        products = data;

        if (products == null) {
          print("NULL");
        } else {
          // print(products);
        }
      });
    });
  }

  final List<Widget> navTabs = <Widget>[
    HomeWidget(),
    ShoppingCart(),
    SearchScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(child: Text(""));
                });
          },
        )),
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

class Drawer_ListTile extends StatelessWidget {
  const Drawer_ListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.assignment_outlined,
          color: Theme.of(context).primaryColor),
      title: const Text('Item 2'),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
}



  // return Column(
  //             children: [
  //               DrawerHeader(
  //                   decoration: BoxDecoration(
  //                     color: Theme.of(context).primaryColor,
  //                   ),
  //                   child: new CircleAvatar(
  //                     radius: 20.0,
  //                     backgroundImage:
  //                         NetworkImage(products[index].productImage),
  //                   )),
  //               Text(products[index].productPrice),
  //               Drawer_ListTile(),
  //               Drawer_ListTile(),
  //               Drawer_ListTile(),
  //             ],
  //           );