import 'package:flutter/material.dart';

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
              ),
            ),
            Text("Akaam Zain"),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text("akaamzain@hotmail.com"),
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
