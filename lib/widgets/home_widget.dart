import 'package:carousel_slider/carousel_slider.dart';
import 'package:farhan_stores/controllers/productsHandler.dart';
import 'package:farhan_stores/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final productHandler = new ProductsHandler();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final promotionSlider = SliverToBoxAdapter(
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
                  child: Image.network(i, fit: BoxFit.cover, width: 100));
            },
          );
        }).toList(),
      ),
    );

    final categoriesSliver = SliverToBoxAdapter(
      child: Container(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 100.0,
              child: Card(
                child: Text('data'),
              ),
            );
          },
        ),
      ),
    );

    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Farhan Stores",
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
          ],
        ),
        body: FutureBuilder<List>(
          future: productHandler
              .fetchProducts(), // this is a code smell. Make sure that the future is NOT recreated when build is called. Create the future in initState instead.
          builder: (context, snapshot) {
            Widget newsListSliver;
            if (snapshot.hasData) {
              newsListSliver = SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Frequently Purchased"),
                            Text("See All >"),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 250.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200.0,
                                child: Card(
                                    child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("1kg"),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                            onPressed: () => {
                                                  Fluttertoast.showToast(
                                                      msg: "Added to Cart",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0),
                                                  context
                                                      .read<Cart>()
                                                      .addToCart(
                                                          snapshot.data![index])
                                                },
                                            icon: Icon(Icons.shopping_cart)),
                                      ],
                                    ),
                                    Image.network(
                                        'https://farhan-stores.herokuapp.com/uploads/' +
                                            snapshot.data![index].productImage,
                                        width: 120),
                                    Text(
                                      "Rs.750",
                                    ),
                                  ],
                                )
                                    // child: Image.network(
                                    //   "https://picsum.photos/100/120",
                                    //   width: 10,
                                    // ),
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              );
            } else {
              newsListSliver = SliverToBoxAdapter(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: <Widget>[
                promotionSlider,
                SliverToBoxAdapter(
                  child: Container(
                    child: Text("Categories"),
                  ),
                ),
                categoriesSliver,
                newsListSliver,
              ],
            );
          },
        ));
  }
}
