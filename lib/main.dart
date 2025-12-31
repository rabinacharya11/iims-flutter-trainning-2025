import 'package:flutter/material.dart';
import 'package:port_app/login_screen.dart';
import 'package:port_app/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginProvider())],

      child: MeroApp(),
    ),
  );
}

class MeroApp extends StatelessWidget {
  const MeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
