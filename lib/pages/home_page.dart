import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(DeleteUser());
                },
                icon: Icon(Icons.delete))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit),
            onPressed: () => Navigator.pushNamed(context, 'details')),
        body: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
          if (state.existUser) {
            return UserDetails(state.user!);
          }
          return Center(child: Text("No existe informacion"));
        }));
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
          ...this
              .user
              .professions
              .map(
                (item) => ListTile(
                  title: Text(item),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
