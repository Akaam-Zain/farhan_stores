import 'package:flutter/material.dart';

class ButtonLarge extends StatelessWidget {
  final btnOnPressed;
  final btnText;

  const ButtonLarge({Key? key, this.btnOnPressed, this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            primary: Colors.red,
          ),
          child: Text(btnText),
          onPressed: btnOnPressed),
    );
  }
}
