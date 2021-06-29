import 'package:flutter/material.dart';
import 'package:states/pages/details_page.dart';
import 'package:states/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'details': (_) => DetailsPage(),
      },
    );
  }
}
