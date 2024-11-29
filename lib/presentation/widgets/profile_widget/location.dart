import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class Location extends StatelessWidget {
  final String location;

  const Location({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Text(
      location, 
      style: GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.location,
      ),
      overflow: TextOverflow.ellipsis,  
      maxLines: 1,  
    );
  }
}