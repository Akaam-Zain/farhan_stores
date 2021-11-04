import 'package:flutter/material.dart';

void main() {
  runApp(const OrderScreen());
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                    unselectedLabelColor: Colors.redAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Pending Orders",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Current Orders",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Previous Orders",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                Container(
                  color: Colors.yellow,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          ),
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          )
                                        ],
                                      )),
                                  Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          ),
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          )
                                        ],
                                      )),
                                  Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.red,
                                            child: Text("Order No. "),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  )
                                ]);
                          })),
                ),
                Icon(Icons.movie),
                Icon(Icons.games),
              ]),
            )));
  }
}
