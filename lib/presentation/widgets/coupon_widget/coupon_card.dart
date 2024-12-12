import 'package:flutter/material.dart';
import 'package:homiefix_application/data/models/coupon_model_dart'; 

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        
      ),
      elevation: 4.0,
     
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Line 1: Title (e.g., "25% Off")
            Text(
              'gjbjbjjbjbjbjbjbjbjbjb',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              
              ),
            ),
            SizedBox(height: 4),
            Text(
              '',
              style: TextStyle(
                fontSize: 16,
              
              ),
            ),
            SizedBox(height: 8),
           
            Text(
             '',
              style: TextStyle(
                fontSize: 14,
              
              ),
            ),
                     ],
        ),
      ),
    );
  }
}

