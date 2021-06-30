import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/pages/details_page.dart';
import 'package:states/pages/home_page.dart';
import 'package:states/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'details': (_) => DetailsPage(),
        },
      ),
    );
  }
}
