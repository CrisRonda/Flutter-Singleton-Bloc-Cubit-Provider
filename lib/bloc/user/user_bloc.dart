import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/user.dart';

part 'user_state.dart';
part 'user_events.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvents event) async* {
    if (event is ActiveUser) {
      yield state.copyWith(user: event.user);
    }
    if (event is ChangeAge) {
      yield state.copyWith(user: state.user!.copyWith(age: event.age));
    }

    if (event is AddProfession) {
      final updatedProfession = [
        ...state.user!.professions,
        "Profession ${state.user!.professions.length + 1}"
      ];

      yield state.copyWith(
          user: state.user!.copyWith(professions: updatedProfession));
    }

    if (event is DeleteUser) {
      yield state.initialState();
    }
  }
}
