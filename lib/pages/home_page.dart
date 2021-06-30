import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () => Navigator.pushNamed(context, 'details')),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserDetails(userService.user)
              : Center(child: Text("Usuario no existe"));
        },
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails(this.user);

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
            title: Text(this.user.name),
          ),
          ListTile(
            title: Text(this.user.age.toString()),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
                color: Colors.amber, fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Divider(),
          ListTile(
            title: Text("Profesion 1"),
          ),
          ListTile(
            title: Text("Profesion 2"),
          ),
        ],
      ),
    );
  }
}
