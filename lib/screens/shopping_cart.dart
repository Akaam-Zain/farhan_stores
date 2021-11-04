import 'package:flutter/material.dart';

import 'package:farhan_stores/controllers/place_order.dart';
import 'package:farhan_stores/models/productsModel.dart';
import 'package:farhan_stores/providers/shopping_cart_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    List<Product> cartList = context.watch<ShoppingCartProvider>().cartList;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              createCartList(
                  context, context.watch<ShoppingCartProvider>().cartList),
              footer(context, cartList)
            ],
          );
        },
      ),
    );
  }

  createCartList(BuildContext context, cart_list) {
    print('test');
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(cart_list, index);
      },
      itemCount: cart_list.length,
    );
  }

  createCartListItem(List<Product> cart_list, int index) {
    return Stack(
      children: <Widget>[
        Container(
          height: 150,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://farhan-stores.herokuapp.com/uploads/" +
                                cart_list[index].productImage))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cart_list[index].productName,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        "Rs. " + cart_list[index].productPrice,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total \$299.00",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 20,
              onPressed: () => {
                context
                    .read<ShoppingCartProvider>()
                    .removeFromCart(cart_list[index].id)
              },
            ),
          ),
        )
      ],
    );
  }
}

footer(BuildContext context, List<Product> cartlist) {
  if (cartlist.length != 0) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "Total \$299.00",
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                    leading: new Icon(Icons.person),
                                    title: new Text('Reciever Name'),
                                    subtitle: new Text("Jason")),
                                ListTile(
                                    leading: new Icon(Icons.pin_drop),
                                    title: new Text('Address'),
                                    subtitle:
                                        new Text("102, 6th Street, Madawala")),
                                ListTile(
                                  leading: new Icon(Icons.phone),
                                  title: new Text('Phone'),
                                  subtitle: new Text('077XXXXXXX'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    PlaceOrder("customerId", 2000.00, 2500.00,
                                        cartlist);
                                  },
                                  child: Text("Place Order"),
                                ),
                                SizedBox(height: 50)
                              ],
                            ),
                          );
                        });
                  },
                  label: Text(
                    "Checkout",
                  ),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 16),
      ),
    );
  } else {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: Center(
          child: Text(
            "Cart is empty!",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
