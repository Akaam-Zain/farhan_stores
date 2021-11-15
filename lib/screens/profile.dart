import 'package:farhan_stores/providers/user_provider.dart';
import 'package:farhan_stores/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  List<String> sectionItems = ["My Orders", "Delivery Address", "Contact"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await FlutterSession().set("token", "");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginIn()));
              },
              child: Text("Logout"),
            )
          ],
          backgroundColor: Colors.white),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
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
            Text("Akaam Zain"),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                  context.watch<UserProvider>().currentUser.customer.userEmail),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sectionItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(sectionItems[index]),
                            // subtitle: Text("2 addresses"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
