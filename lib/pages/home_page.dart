import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controllers/user_controller.dart';
import 'package:states/models/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          // onPressed: () => Navigator.pushNamed(context, 'details')
          onPressed: () => Get.toNamed("details", arguments: {
                'name': "Cristian",
                "age": 12,
              })),
      body: Obx(() => userCtrl.existUser.isTrue
          ? UserDetails(userCtrl.user.value)
          : Center(
              child: Text("No existe informacion"),
            )),
    );
  }
}

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails(this.user) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
                color: Colors.amber, fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Divider(),
          ListTile(
            title: Text(user.name!),
          ),
          ListTile(
            title: Text(user.age!.toString()),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
                color: Colors.amber, fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Divider(),
          ...this
              .user
              .professions
              .map((item) => ListTile(
                    title: Text(item),
                  ))
              .toList()
        ],
      ),
    );
  }
}
