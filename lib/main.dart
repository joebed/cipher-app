import 'package:flutter/material.dart';

import 'package:ciphers/caesar/caesar_screen.dart';
import 'package:ciphers/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ciphers',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: MyHomePage(title: 'Ciphers'),
        routes: {
          CaesarScreen.routeName: (ctx) => CaesarScreen(),
        });
  }
}
