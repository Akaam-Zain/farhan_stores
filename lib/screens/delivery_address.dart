import 'package:flutter/material.dart';

class DeliveryDetails extends StatefulWidget {
  DeliveryDetails({Key? key}) : super(key: key);

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  final textControllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Enter Delivery Address",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            new Container(
              child: new Image.network(
                "https://i.ibb.co/bvHMYRK/delivery-image.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: textControllerAddress,
                decoration: InputDecoration(
                  hintText: 'Delivery Address',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Text('Skip →',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
