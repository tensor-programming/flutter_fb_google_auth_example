import 'package:flutter/material.dart';

import 'package:fire_store_example/pages/home.dart';
import 'package:fire_store_example/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        "home-page": (context) => MyHomePage(),
        "login-page": (context) => LoginPage(),
      },
      home: LoginPage(),
    );
  }
}
