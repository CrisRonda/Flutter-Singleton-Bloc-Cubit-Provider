part of 'user_bloc.dart';

class UserState {
  late bool existUser;
  User? user;

  UserState({User? newUser}) {
    user = newUser ?? null;
    existUser = (newUser != null);
  }

  UserState copyWith({User? user}) => UserState(newUser: user ?? this.user);

  UserState initialState() => new UserState(newUser: null);
}
