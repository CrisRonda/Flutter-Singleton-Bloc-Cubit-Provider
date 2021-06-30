import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return Container(
              child: Text(userService.existUser
                  ? 'Hola: ${userService.user.name}!'
                  : "Setup"),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hola Mundo'),
            MaterialButton(
              onPressed: () {
                userService.setUser(User(name: "Cristian", age: 12));
              },
              child: Text("Establecer usuario",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                if (userService.existUser) {
                  userService.setAge(35);
                }
              },
              child: Text("Establecer edad",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {},
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
