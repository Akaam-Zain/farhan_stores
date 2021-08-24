import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final formText;
  final isObscure;

  const FormWidget({Key? key, this.formText, this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: formText),
      ),
    );
  }
}
