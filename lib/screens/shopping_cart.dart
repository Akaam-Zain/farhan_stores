import 'package:farhan_stores/models/productsModel.dart';
import 'package:farhan_stores/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    List<Product> cart_list = context.watch<Cart>().getProductList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return cart_list.isEmpty
              ? Center(child: Text("Cart is empty"))
              : ListView(
                  children: <Widget>[
                    createCartList(context, cart_list),
                    footer(context)
                  ],
                );
        },
      ),
    );
  }

  createCartList(BuildContext context, cart_list) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(context, cart_list, index);
      },
      itemCount: cart_list.length,
    );
  }

  createCartListItem(BuildContext context, cart_list, index) {
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
                              'https://farhan-stores.herokuapp.com/uploads/' +
                                  cart_list[index].productImage)))),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(""),
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cart_list[index].productName,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        "Unit Price",
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
                context.read<Cart>().removeFromCart(cart_list[0]),
              },
            ),
          ),
        )
      ],
    );
  }
}

footer(BuildContext context) {
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
                                title: const Text('Customer Name'),
                                subtitle: const Text("Jason Holder"),
                                trailing: Text("Edit"),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.location_pin),
                                title: const Text('Delivery Address'),
                                subtitle:
                                    const Text("419/1 Waragashinna, New York "),
                                trailing: Text("Edit"),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.phone),
                                title: const Text('Phone No.'),
                                subtitle: const Text("+9477 016 1414"),
                                trailing: Text("Edit"),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal"),
                                        Text("Rs.2000")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal"),
                                        Text("Rs.2000")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal"),
                                        Text("Rs.2000")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => {},
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
}
