import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [Actions()],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () => Navigator.pushNamed(context, 'details')),
      body: BodyScaffold(),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context, listen: true);
    switch (userCubit.state.runtimeType) {
      case UserActive:
        return IconButton(
            onPressed: () {
              userCubit.removeUser();
            },
            icon: Icon(Icons.logout));

      default:
        return SizedBox.shrink();
    }
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UserActive:
            return UserDetails((state as UserActive).user);
          default:
            return Center(child: Text("No existe informacion"));
        }
      },
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
              .map(
                (item) => ListTile(
                  title: Text(item),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
