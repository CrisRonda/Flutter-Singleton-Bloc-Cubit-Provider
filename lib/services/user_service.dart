import 'dart:async';

import 'package:states/models/user.dart';

// Private class
class _UserService {
  User? _user;

  StreamController<User> _userStreamController =
      new StreamController<User>.broadcast();

  User get user => this._user!;

  Stream<User> get userStream => this._userStreamController.stream;

  bool get existUser => (this._user != null) ? true : false;

  setUser(User newUser) {
    this._user = newUser;
    this._userStreamController.add(newUser);
  }

  setAge(int age) {
    this._user?.age = age;
    this._userStreamController.add(this._user!);
  }

  dispose() {
    this._userStreamController.close();
  }
}

// export the singleton

final userService = new _UserService();
