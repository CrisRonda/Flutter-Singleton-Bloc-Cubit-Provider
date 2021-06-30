import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(userService.existUser ? userService.user.name : "Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hola Mundo'),
            MaterialButton(
              onPressed: () {
                userService.user = new User(
                    name: "Cristian",
                    age: 32,
                    professions: ["Gamer", "Engineer"]);
              },
              child: Text("Establecer usuario",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userService.age = 45;
              },
              child: Text("Establecer edad",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userService.addProfession();
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
