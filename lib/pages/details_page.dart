import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (_, state) {
            return Text(state.existUser ? state.user!.name : "Details");
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hola Mundo'),
            MaterialButton(
              onPressed: () {
                final user = new User(
                    name: "Cristian Ronda",
                    age: 32,
                    professions: ["Developer"]);
                userBloc.add(ActiveUser(user));
              },
              child: Text("Establecer usuario",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(ChangeAge(56));
              },
              child: Text("Establecer edad",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(AddProfession());
              },
              child: Text("Agregar nueva profesion",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
