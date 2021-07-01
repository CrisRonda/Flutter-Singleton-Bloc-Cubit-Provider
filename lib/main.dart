import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states/pages/details_page.dart';
import 'package:states/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      getPages: [
        GetPage(name: 'home', page: () => HomePage()),
        GetPage(name: 'details', page: () => DetailsPage()),
      ],
      // routes: {
      //   'home': (_) => HomePage(),
      //   'details': (_) => DetailsPage(),
      // },
    );
  }
}
