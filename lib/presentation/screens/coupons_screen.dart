import 'package:flutter/material.dart';

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
    expirationDate: '2025-01-25', // Valid expiration date
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Display heading text
              Text(
                Constants.coupons, // Replace with appropriate constant
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textfieldtype,
                ),
              ),
              const SizedBox(height: 16),

              // Display the coupon card
              CouponCard(coupon: sampleCoupon),
            ],
          ),
        ),
      ),
    );
  }
}
