import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final isObscure;
  final formText;
  const FormWidget({Key? key, this.formText, this.isObscure = false})
      : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  _togglePasswordView() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: TextFormField(
        obscureText: widget.isObscure,
        decoration: InputDecoration(
            suffix: InkWell(
                onTap: _togglePasswordView, child: Icon(Icons.visibility)),
            border: UnderlineInputBorder(),
            labelText: widget.formText),
      ),
    );
  }
}
