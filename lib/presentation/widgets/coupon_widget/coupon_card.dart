import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';  // Import Google Fonts
import 'package:homiefix_application/data/models/coupon_model_dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.16, 
      child: Card(
        color: AppColors.cardbackround,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items horizontally
            crossAxisAlignment: CrossAxisAlignment.start, // Center items vertically
            children: [
              // Logo, centered vertically
              ClipOval(
                child: Container(
                  width: 33,
                  height: 33,
                  color: Colors.grey[200],
                  child: SvgPicture.asset(
                    'assets/icons/logo vector.svg',
                    fit: BoxFit.cover,
                    placeholderBuilder: (BuildContext context) =>
                        const Center(child: CircularProgressIndicator()), // Fallback for loading
                  ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Coupon details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
                    Text(
                      coupon.titleLine2,
                      style: GoogleFonts.figtree( 
                        fontSize: 12,  
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coupon.titleLine1,
                      style: GoogleFonts.figtree(  // Using Google Fonts
                        fontSize: 16,  // Set appropriate font size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coupon.description,
                      style: GoogleFonts.figtree(  // Using Google Fonts
                        fontSize: 12, 
                        fontWeight: FontWeight.w400 // Set appropriate font size
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
