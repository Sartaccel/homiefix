import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class ProfileOption extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function() onTap;

  const ProfileOption({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      leading: SvgPicture.asset(image, width: screenWidth * 0.05, height: screenWidth * 0.05),
      title: Text(
        title,
        style: GoogleFonts.figtree(
          fontSize: screenWidth * 0.04,  
          color: AppColors.head
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.figtree(
          fontSize: screenWidth * 0.035,  
          color: AppColors.info
        ),
      ),
      trailing: Transform.scale(
        scale: 0.50, 
        child: Icon(Icons.arrow_forward_ios, color: AppColors.arrow_forward_ios, size: screenWidth * 0.06),  // Adjust icon size based on screen width
      ),
      onTap: onTap,
    );
  }
}
