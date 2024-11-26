import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/image.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class Referbox extends StatelessWidget {
  const Referbox({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = screenWidth * 0.8; // Adjust the width to 90% of screen width

    return Card(
      color: AppColors.boxbackround,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      elevation: 1,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: boxWidth,
                height: 132, // Height remains fixed
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constants.referHead,
                          style: GoogleFonts.figtree(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.refertext,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8),
                        Text(
                          Constants.referinfo,
                          style: GoogleFonts.figtree(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.refertextinfo,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 24,
                          width: boxWidth * 0.35, // Adjust the width based on container width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.invitebox),
                          ),
                          child: Center(
                            child: Text(
                              Constants.invite,
                              style: GoogleFonts.figtree(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.invitebox,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: screenWidth * 0.00,  // Adjust positioning based on screen width
                      top: screenWidth * 0.05,
                      child: SvgPicture.asset(
                        Appimage.inviteimage,
                        width: screenWidth * 0.14,  // Adjust width based on screen width
                        height: screenWidth * 0.14,  // Adjust height based on screen width
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
