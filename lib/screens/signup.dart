import 'package:farhan_stores/models/userModel.dart';
import 'package:farhan_stores/screens/screens.dart';
import 'package:farhan_stores/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:farhan_stores/controllers/signup_handler.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Customer register_Customer = new Customer(
      userUsername: "",
      userEmail: "",
      userPassword: "",
      userAddress: "",
      userPhoneNo: 0,
      userImage: "");
  final textControllerUserName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPass = TextEditingController();
  final textControllerComPass = TextEditingController();
  final textControllerComPhone = TextEditingController();

  bool _passwordVisible = false;
  bool _conPasswordVisible = false;

  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/shopping_cart_signup.jpeg"),
        )),
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(height: 25.0),
              SizedBox(height: 100.0),
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Username'),
                        controller: textControllerUserName,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                            controller: textControllerEmail,
                            validator: (value) {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          controller: textControllerPass,
                          obscureText: _passwordVisible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _conPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _conPasswordVisible = !_conPasswordVisible;
                                });
                              },
                            ),
                          ),
                          controller: textControllerComPass,
                          obscureText: _conPasswordVisible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Phone No. : eg. 0777 xxx xxxx'),
                          controller: textControllerComPhone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: ButtonLarge(
                          btnText: "Sign Up",
                          btnOnPressed: () async {
                            register_Customer.userUsername =
                                textControllerUserName.text;
                            register_Customer.userEmail =
                                textControllerEmail.text;
                            register_Customer.userPassword =
                                textControllerPass.text;
                            register_Customer.userImage = "";
                            register_Customer.userAddress = "419, Kandy";
                            register_Customer.userPhoneNo = 0770161414;

                            print(textControllerUserName.text);
                            final response =
                                await SignUpUserHandler(register_Customer);
                            if (response == "") {
                              setState(() {
                                // loginStatus = false;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                              setState(() {
                                // loginStatus = true;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 30),
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                children: [
                                  TextSpan(text: "Already have an account?"),
                                  new TextSpan(
                                    text: " Login",
                                    style: TextStyle(color: Colors.blueAccent),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginIn()));
                                      },
                                  )
                                ]),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
