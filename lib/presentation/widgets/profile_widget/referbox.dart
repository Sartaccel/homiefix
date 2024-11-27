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
    final screenHeight = MediaQuery.of(context).size.height;
    final boxWidth = screenWidth * 0.83; 
    final boxHeight = screenHeight * 0.15;
    final paddingValue = screenWidth * 0.03; 

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
                height: boxHeight, 
                padding: EdgeInsets.all(paddingValue), 
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constants.referHead,
                          style: GoogleFonts.figtree(
                            fontSize: screenWidth * 0.035, 
                            fontWeight: FontWeight.w700,
                            color: AppColors.refertext,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: screenHeight * 0.01),  
                        Text(
                          Constants.referinfo,
                          style: GoogleFonts.figtree(
                            fontSize: screenWidth * 0.035, 
                            fontWeight: FontWeight.w400,
                            color: AppColors.refertextinfo,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),  
                        Container(
                          height: boxHeight * 0.18, 
                          width: boxWidth * 0.35, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.invitebox),
                          ),
                          child: Center(
                            child: Text(
                              Constants.invite,
                              style: GoogleFonts.figtree(
                                fontSize: screenWidth * 0.03, 
                                fontWeight: FontWeight.w400,
                                color: AppColors.invitebox,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: screenWidth * 0.02, 
                      top: boxHeight * 0.17,
                      child: SvgPicture.asset(
                        Appimage.inviteimage,
                        width: boxHeight * 0.5,
                        height: boxHeight * 0.5, 
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