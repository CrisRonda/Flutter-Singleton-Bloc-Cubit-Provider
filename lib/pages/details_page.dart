import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hola Mundo'),
            MaterialButton(
              onPressed: () {
                userCubit.setUset(new User(
                    age: 27,
                    name: 'Cristian',
                    professions: ['Developer', "Designer"]));
              },
              child: Text("Establecer usuario",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userCubit.setAgeUser(56);
              },
              child: Text("Establecer edad",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userCubit.addProfession();
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
