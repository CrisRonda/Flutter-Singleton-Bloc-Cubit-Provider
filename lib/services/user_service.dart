import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;
  User get user => this._user!;

  // ignore: unnecessary_null_comparison
  bool get existUser => (this._user != null) ? true : false;

  set user(User newUser) {
    this._user = newUser;
    notifyListeners();
  }

  set age(int newAge) {
    this._user!.age = newAge;
    notifyListeners();
  }

  addProfession() {
    this
        ._user!
        .professions
        .add("Profesion ${this._user!.professions.length + 1}");
    notifyListeners();
  }

  removeUser() {
    this._user = null;
    notifyListeners();
  }
}
