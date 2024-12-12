import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/add_new_address.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'otp_success.dart'; // Import the OtpSuccess page

class ManageAddress extends StatefulWidget {
  @override
  _ManageAddressState createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65,),
    Row(
    
      children: [
        SizedBox(width: 25,),
        SvgPicture.asset("assets/icons/back_button.svg"),
        SizedBox(width: 100,),
        Text("Manage Address", style: TextStyle(
          fontSize: 16,  
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.font,
        ),),
      ],
    ),
    SizedBox(height: 25,),
    GestureDetector(
  onTap: () {
    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddNewAddress(), // Redirect to OTP page
                      ),
                    );
    print("Container clicked!");
  },
  child: Container(
    width: 350,
    padding: EdgeInsets.all(15.0), // Padding inside the container
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0), // Add rounded corners
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align items horizontally
      crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
      children: [
        SvgPicture.asset(
          "assets/icons/plus_icon.svg",
        ),
        SizedBox(width: 20.0), // Spacing between SVG and text
        Text(
          "Add new address",
          style: TextStyle(
            fontSize: 14.0, // Text size
            fontWeight: FontWeight.w600, // Text weight
            color: Color(0xff009980), // Text color
          ),
        ),
      ],
    ),
  ),
)


          ],
        ),
      ),
    );
  }
}
