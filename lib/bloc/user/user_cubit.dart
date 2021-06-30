import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  setUset(User user) {
    emit(UserActive(user));
  }

  setAgeUser(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final updatedUser = currentState.user.copyWith(age: age);
      emit(UserActive(updatedUser));
    }
  }

  addProfession() {
    final currentState = state;
    if (currentState is UserActive) {
      final updatedProfessions = [
        ...currentState.user.professions,
        'Profession ${currentState.user.professions.length + 1}'
      ];
      final updatedUser =
          currentState.user.copyWith(professions: updatedProfessions);
      emit(UserActive(updatedUser));
    }
  }

  removeUser() {
    emit(UserInitial());
  }
}
