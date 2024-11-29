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
      visualDensity: VisualDensity(vertical: -1.5),
      leading: Padding(
        padding: EdgeInsets.only(right: screenWidth * 0.03),  
        child: SvgPicture.asset(image, width: screenWidth * 0.05, height: screenWidth * 0.05),
      ),
      title: Text(
        title,
        style: GoogleFonts.figtree(
          fontSize: 14,
          fontWeight: FontWeight.w400,  
          color: AppColors.head,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.figtree(
          fontSize: 12,  
          color: AppColors.info,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Container(
  width: screenWidth * 0.12, // Increased the width of the trailing Container
  alignment: Alignment.centerRight, 
  padding: EdgeInsets.only(right: screenWidth * 0.00), // Added padding for extra spacing
  child: Transform.scale(
    scale: 0.7, 
    child: Icon(
      Icons.arrow_forward_ios,
      color: AppColors.arrow_forward_ios, 
      size: screenWidth * 0.05,
    ),
  ),
),

      onTap: onTap,
    );
  }
}