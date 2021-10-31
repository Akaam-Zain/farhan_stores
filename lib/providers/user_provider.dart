import 'package:farhan_stores/models/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  var _user;

  User get currentUser => _user;

  void storeUser(User currentUser) {
    _user = currentUser;
  }
}
