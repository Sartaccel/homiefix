import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/data/models/coupon_model_dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/coupon_widget/coupon_card.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final Coupon sampleCoupon = Coupon(
    titleLine1: '25% Off',
    titleLine2: 'Exclusive First Service Coupon Offer!',
    description: 'Our exclusive coupon is valid until January 25, 2025, so don\'t miss out!',
    expirationDate: '2025-01-25',
  );

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic padding and spacing based on screen width
    final double paddingSize = MediaQuery.of(context).size.width * 0.04; // 4% of screen width
    final double availableWidth = MediaQuery.of(context).size.width; // Full width of the screen
    final double textWidth = availableWidth * 0.65; 

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cuponsbackground,
        body: Padding(
          padding: EdgeInsets.all(paddingSize), 
          child: Column(
            children: [
             
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                  // SizedBox for dynamic width calculation based on screen width
                  SizedBox(
                    width: textWidth, // Dynamically set width of the text container
                    child: Text(
                      Constants.coupons,
                      textAlign: TextAlign.center, // Center the text
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.couponshead
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), 

           
              CouponCard(coupon: sampleCoupon),
            ],
          ),
        ),
      ),
    );
  }
}
