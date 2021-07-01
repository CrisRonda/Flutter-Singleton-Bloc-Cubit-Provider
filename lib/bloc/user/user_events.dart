part of 'user_bloc.dart';

@immutable
abstract class UserEvents {}

class ActiveUser extends UserEvents {
  final User user;

  ActiveUser(this.user);
}

class ChangeAge extends UserEvents {
  final int age;
  ChangeAge(this.age);
}

class AddProfession extends UserEvents {
  AddProfession();
}


class DeleteUser extends UserEvents {
  DeleteUser();
}
