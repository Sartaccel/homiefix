// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({super.key});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  // Phone number to call
  final String phoneNumber = '+91 8270544862';
  // Email address to send mail
  final String emailAddress = 'support@homiefix.com';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint('Could not launch $phoneUri');
    }
  }

  Future<void> _sendMail(String emailAddress) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': 'Support Request',
        'body': 'Hello, I need help regarding...',
      },
    );

    try {
      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
     
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingSize = screenWidth * 0.04;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cuponsbackground,
        body: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Column(
            children: [
              // Header Row for Back Arrow and Contact Us Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      Constants.contactUs,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.couponshead,
                      ),
                    ),
                  ),
                  SizedBox(width: 48), // Balance spacing for the row
                ],
              ),
              const SizedBox(height: 50),

              // Contact Us SVG Icon
              Center(
                child: SvgPicture.asset(
                  AppIcons.contactUs,
                  height: screenHeight * 0.10,
                  placeholderBuilder: (context) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 25),

              // Help Text
              Text(
                Constants.helptext,
                style: GoogleFonts.figtree(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),

              // Phone call container with logic
              GestureDetector(
                onTap: () {
                  _makePhoneCall(phoneNumber);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.cardbackround,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.phoner,
                        height: screenHeight * 0.025,
                        placeholderBuilder: (context) =>
                            const Icon(Icons.phone),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        Constants.phone,
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.couponshead,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Mail container
              GestureDetector(
                onTap: () {
                  _sendMail(emailAddress);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.cardbackround,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.mail,
                        height: screenHeight * 0.04,
                        placeholderBuilder: (context) =>
                            const Icon(Icons.email),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        Constants.mail,
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.couponshead,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
