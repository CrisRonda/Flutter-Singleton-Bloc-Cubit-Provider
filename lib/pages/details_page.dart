import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controllers/user_controller.dart';
import 'package:states/models/user.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    final userCtrl = Get.find<UserController>();

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
                userCtrl.setUser(new User(
                    name: "Cristian Ronda",
                    age: 27,
                    professions: ['Developer']));
                Get.snackbar("Listo!", "Usuario establecido",
                    backgroundColor: Colors.amber,
                    duration: Duration(seconds: 2),
                    boxShadows: [
                      BoxShadow(
                          color: Colors.black38, spreadRadius: 2, blurRadius: 5)
                    ]);
              },
              child: Text("Establecer usuario",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userCtrl.changeAgeUser(56);
              },
              child: Text("Establecer edad",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                userCtrl.addProfessions(
                    "Profession ${userCtrl.professionCount + 1}");
              },
              child: Text("Agregar nueva profesion",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: Text("Cambiar tema",
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
