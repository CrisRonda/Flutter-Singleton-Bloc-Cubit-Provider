part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final existUser = false;
}

class UserActive extends UserState {
  final existUser = true;
  final User user;

  UserActive(this.user);
}
