import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/screens/addnew_screen%20.dart';
import 'package:homiefix_application/presentation/screens/settings_screen.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SettingsScreen()
    );
  }
}