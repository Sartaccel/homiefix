import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class Name extends StatelessWidget {
  final String name;

  const Name({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Text(
      name,
      style: GoogleFonts.figtree(
        fontSize: screenWidth * 0.045, 
        fontWeight: FontWeight.w500,
        color: AppColors.username,
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> jijo
