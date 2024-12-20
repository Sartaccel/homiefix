import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/screens/profile_logout_screen.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'package:homiefix_application/presentation/widgets/home_widget/home_screen_widget.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/location.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profile_pic.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profileoption.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/referbox.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/username.dart';
import 'package:http/http.dart' as http;

class AcService extends StatefulWidget {
  const AcService({super.key});

  @override
  State<AcService> createState() => _AcServiceState();
}

class _AcServiceState extends State<AcService> {
  String serviceCharge = "Fetching...";

  @override
  void initState() {
    super.initState();
    fetchServiceCharge();
  } 

 Future<void> fetchServiceCharge() async {
  const apiUrl = "https://0c12-223-185-27-185.ngrok-free.app/services/name/AC/price";
  try {
    final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 10));
    
    print('Status Code: ${response.statusCode}'); // Log the status code for debugging
    print('Response Body: ${response.body}'); // Log the body for debugging
    
    if (response.statusCode == 200) {
      // Backend is returning plain text
      setState(() {
        serviceCharge = "₹${response.body.trim()}"; // Trim any whitespace and format
      });
    } else {
      setState(() {
        serviceCharge = "Failed to load";
      });
    }
  } catch (error) {
    print('Error: $error'); // Log any errors for better understanding
    setState(() {
      serviceCharge = "Error";
    });
  }
}

@override
Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final paddingValue = screenSize.width * 0.02;

  return SafeArea(
    child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/back_button.svg"),
                      SizedBox(width: 85),
                      Text(
                        'AC Repair and Service',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 15,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Image.asset("assets/images/ac_service3.png"),
                  // Your content widgets here
                  SizedBox(height: 10), // Adding space for fixed bottom container
                  Container(
  padding: EdgeInsets.all(16.0),
  width: 350,
  height: 120,
  decoration: BoxDecoration(
    color: Color(0xFFF7F7F7),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      
    ],
  ),
  child: Column(
    children: [
      Row(
        children: [
          SvgPicture.asset(
            'assets/icons/disclaimer_icon.svg',
            height: 24.0,
            width: 24.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disclaimer',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 13,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Please note that the final price may vary based on '
                  'additional services such as part replacement, '
                  'purchasing new components, etc.',
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 12,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),

SizedBox(height: 20,),
SizedBox(
    width: 326,
    child: Text(
        'What we do?',
        style: TextStyle(
            color: Color(0xFF191919),
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
            height: 0,
        ),
    ),
),

SizedBox(height: 15,),

SizedBox(
  width: 340,
  child: Row(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Text("•")),
      SizedBox(width: 8,),
      Text(
        'We begin by conducting a detailed inspection of \nyour AC unit, checking for any issues.',
        style: TextStyle(
          color: Color(0xFF191919),
          fontSize: 14,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
          height: 1.5, // Proper line height
        ),
      ),
    ],
  ),
),

SizedBox(height: 8,),

SizedBox(
  width: 340,
  child: Row(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Text("•")),
      SizedBox(width: 8,),
      Text(
        'We begin by conducting a detailed inspection of \nyour AC unit, checking for any issues.',
        style: TextStyle(
          color: Color(0xFF191919),
          fontSize: 14,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
          height: 1.5, // Proper line height
        ),
      ),
    ],
  ),
),

SizedBox(height: 8,),

SizedBox(
  width: 340,
  child: Row(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Text("•")),
      SizedBox(width: 8,),
      Text(
        'We begin by conducting a detailed inspection of \nyour AC unit, checking for any issues.',
        style: TextStyle(
          color: Color(0xFF191919),
          fontSize: 14,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
          height: 1.5, // Proper line height
        ),
      ),
    ],
  ),
),



SizedBox(height: 20,),

SizedBox(
    width: 326,
    child: Text(
        'Similar services',
        style: TextStyle(
            color: Color(0xFF191919),
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
            height: 0,
        ),
    ),
),

SizedBox(height: 15,),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    HomeScreenServiceBox(
      firstText: 'AC',
      secondText: '',
      svgAssetPath: 'assets/images/home_appliance.svg',
    ),
    HomeScreenServiceBox(
      firstText: 'Fan',
      secondText: '',
      svgAssetPath: 'assets/images/carpentry.svg',
    ),
    HomeScreenServiceBox(
      firstText: 'Fridge',
      secondText: '',
      svgAssetPath: 'assets/images/home_appliance.svg',
    ),
  ],
),


SizedBox(height: 20,),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 20,),
    Text(
        'Have any queries?',
        style: TextStyle(
            color: Color(0xFF191919),
            fontSize: 14,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
            height: 0.11,
        ),
    ),
  ],
),


SizedBox(height: 20,),

Container(
    width: 328,
    height: 44,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(8),
        ),
    ),
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
                width: 18,
                height: 18,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                
            ),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/icons/service_phone_icon.svg"),
            SizedBox(width: 10,),
            Text(
                'Call us',
                style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 14,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                ),
            ),
        ],
    ),
),
SizedBox(height: 85,),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 76,
              padding: const EdgeInsets.only(
                top: 16,
                left: 24,
                right: 16,
                bottom: 16,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFFCFCFC),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF0F0F0),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service charge',
                        style: TextStyle(
                          color: const Color(0xFF4C4C4C),
                          fontSize: 11,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$serviceCharge',
                        style: TextStyle(
                          color: const Color(0xFF191919),
                          fontSize: 20,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 44,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF009980),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}


























