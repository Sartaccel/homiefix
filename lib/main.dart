import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/screens/home_appliance_service.dart';
import 'package:homiefix_application/presentation/screens/home_appliances/ac_service.dart';
import 'package:homiefix_application/presentation/screens/home_screen.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}