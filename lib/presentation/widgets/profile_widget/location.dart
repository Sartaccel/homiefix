import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  final String location;

  const Location({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}
