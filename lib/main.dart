import 'package:flutter/material.dart';
import 'package:port_app/login_screen.dart';

void main() {
  runApp(MeroApp());
}

class MeroApp extends StatelessWidget {
  const MeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
