import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  final String name;

  const Name({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
