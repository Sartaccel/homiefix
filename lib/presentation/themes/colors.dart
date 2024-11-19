import 'package:flutter/material.dart';

class AppColors extends StatelessWidget {
  const AppColors({Key? key}) : super(key: key);

  // Button Colours
  static const Color ButtonColour = Color(0xFF009980);
  static const Color InviteButtonColour = Color(0xFFF6FFFD);                                                                   
  static const Color LogoutButtonColour = Color(0xFFFFFFFF);

// Button Text Colours
  static const Color ButtonTextColor = Color(0xFFFFFFFF);
  static const Color InviteButtonTextColor = Color(0xFF00917C);
  static const Color LogoutButtonTextColor = Color(0xFF636363);

// Button Stroke Colours
static const Color InviteButtonStrokeColor = Color(0xFF00917C);
static const Color LogoutButtonStrokeColor = Color(0xFF636363);

//BottomNavbar Icon Colours
static const Color BottomNavbarIconUnselected = Color(0xFF191919);
static const Color BottomNavbarIconSelected = Color(0xFF009980);


  @override
  Widget build(BuildContext context) {
    // Return an empty container since this widget is just a holder for colors
    return const SizedBox.shrink();
  }
}
