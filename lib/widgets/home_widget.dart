import 'package:carousel_slider/carousel_slider.dart';
import 'package:farhan_stores/controllers/productsHandler.dart';
import 'package:farhan_stores/models/productsModel.dart';
import 'package:farhan_stores/providers/shopping_cart_provider.dart';
import 'package:farhan_stores/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    ProductsHandler productsHandler = new ProductsHandler();
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Farhan Stores"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            UserAccountsDrawerHeader(
              accountName: Text(context
                  .watch<UserProvider>()
                  .currentUser
                  .customer
                  .userUsername),
              accountEmail: Text(
                  context.watch<UserProvider>().currentUser.customer.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://farhan-stores.herokuapp.com/uploads/user_pro_pic/" +
                        context
                            .watch<UserProvider>()
                            .currentUser
                            .customer
                            .userImage
                            .toString()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text('Order History'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: const Text('About the Store'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: const Text('Contact us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: productsHandler.fetchProducts(),
        builder: (context, snapshot) {
          Widget productListSliver;
          if (snapshot.hasData) {
            productListSliver = SliverPadding(
              padding: EdgeInsets.only(left: 30),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 220.0,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(children: [
                          Container(
                              margin:
                                  new EdgeInsets.symmetric(horizontal: 10.0),
                              color: Colors.white,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      child: IconButton(
                                        alignment: Alignment.centerRight,
                                        icon: Icon(Icons.shopping_bag),
                                        onPressed: () {
                                          final snackBar = SnackBar(
                                              content:
                                                  const Text('Added to cart!'),
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor);

                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          context
                                              .read<ShoppingCartProvider>()
                                              .addToCart(snapshot.data![index]);
                                        },
                                      ),
                                    ),
                                    Image.network(
                                      "https://farhan-stores.herokuapp.com/uploads/" +
                                          snapshot.data![index].productImage,
                                      width: 120,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].productName),
                                        Text(snapshot.data![index].productPrice,
                                            textAlign: TextAlign.start),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            productListSliver = SliverToBoxAdapter(
                child: Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        height: 50.0,
                        width: 50.0,
                      ),
                    )
                  ],
                ),
              ),
            ));
          }
          return CustomScrollView(
            slivers: <Widget>[
              //Sliver 01
              SliverToBoxAdapter(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Image.network(i,
                                fit: BoxFit.cover, width: 100));
                      },
                    );
                  }).toList(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 15, left: 25, bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    child: Text("Categories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 20),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100.0,
                          child: Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                      "https://www.iconsdb.com/icons/preview/red/milk-2-xxl.png",
                                      width: 50),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Essentials",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50,
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Frequently Purchased",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Text("View All >")),
                        ]),
                  ),
                ]),
              ),

//Sliver 02

              productListSliver,
            ],
          );
        },
      ),
    );
  }
}
