import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.BottomNavbarIconSelected, 
        unselectedItemColor: AppColors.BottomNavbarIconUnselected, 
        backgroundColor: AppColors.bottombackground, 
        type: BottomNavigationBarType.fixed, 
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> jijo
