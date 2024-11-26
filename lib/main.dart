import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/screens/profile_screen.dart';
import 'package:homiefix_application/presentation/widgets/bottom_navigation_bar.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: BottomNavigation()
    );
  }
}


