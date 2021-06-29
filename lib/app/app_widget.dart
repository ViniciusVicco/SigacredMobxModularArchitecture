import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFEA9A2F),
        backgroundColor: Colors.white,
        accentColor: Color(0xFF1134F7),
      ),
    ).modular();
  }
}
