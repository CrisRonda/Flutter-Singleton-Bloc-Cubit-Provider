import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          userService.existUser
              ? IconButton(
                  onPressed: userService.removeUser, icon: Icon(Icons.logout))
              : SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () => Navigator.pushNamed(context, 'details')),
      body: userService.existUser
          ? UserDetails(userService.user)
          : Center(
              child: Text("Sin datos de usuario"),
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
            title: Text(user.name),
          ),
          ListTile(
            title: Text(user.age.toString()),
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
              .toList(),
        ],
      ),
    );
  }
}
