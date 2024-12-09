import 'package:flutter/material.dart';

class CustomInkBoxHighlightWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomInkBoxHighlightWidget({
    Key? key,
    required this.child,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent, 
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
