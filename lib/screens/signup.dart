import 'package:farhan_stores/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      FormWidget(
                        formText: "First Name",
                      ),
                      FormWidget(
                        formText: "Last Name",
                      ),
                      FormWidget(
                        formText: "Email",
                      ),
                      FormWidget(
                        formText: "Password",
                        isObscure: true,
                      ),
                      FormWidget(
                        formText: "Confirm Password",
                        isObscure: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: ButtonLarge(
                          btnText: "Sign Up",
                          btnOnPressed: () => {print("Sign Up Button Pressed")},
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
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
                                        debugPrint("Gesture detected");
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
