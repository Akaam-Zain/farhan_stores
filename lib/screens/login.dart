import 'package:farhan_stores/controllers/login_handler.dart';
import 'package:farhan_stores/providers/products_provider.dart';
import 'package:farhan_stores/providers/user_provider.dart';
import 'package:farhan_stores/screens/home.dart';
import 'package:farhan_stores/screens/screens.dart';
import 'package:farhan_stores/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_session/flutter_session.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({Key? key}) : super(key: key);

  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final textControllerEmail = TextEditingController();
  final textControllerPass = TextEditingController();

  var loginStatus = true;
  @override
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
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Email'),
                          controller: textControllerEmail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Password'),
                          controller: textControllerPass,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: ButtonLarge(
                            btnText: "Login ",
                            btnOnPressed: () async {
                              final currentUser = await AuthorizeLogin(
                                  textControllerEmail.text,
                                  textControllerPass.text);
                              if (currentUser.customer.userUsername == "" ||
                                  currentUser.customer.userUsername.isEmpty) {
                                setState(() {
                                  loginStatus = false;
                                });
                              } else {
                                context
                                    .read<UserProvider>()
                                    .storeUser(currentUser);
                                await FlutterSession()
                                    .set("token", currentUser);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                                setState(() {
                                  loginStatus = true;
                                });
                              }
                            }),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                children: [
                                  TextSpan(text: "Do not have an account?"),
                                  new TextSpan(
                                    text: " Sign Up",
                                    style: TextStyle(color: Colors.blueAccent),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 100,
                        child: loginStatus
                            ? Center(child: Text(""))
                            : Text(
                                "Invalid username or password",
                                style: TextStyle(color: Colors.red),
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
