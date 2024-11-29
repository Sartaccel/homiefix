import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'otp_success.dart'; // Import the OtpSuccess page

class OtpEntering extends StatefulWidget {
  @override
  _OtpEnteringState createState() => _OtpEnteringState();
}

class _OtpEnteringState extends State<OtpEntering> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  void _submitOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    print('OTP entered: $otp');

    // Navigate to OtpSuccess page
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => OtpEntering()),
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffEDF8F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SvgPicture.asset(
              "assets/images/login_logo.svg",
              width: 287,
              height: 207,
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(top: 65),
              width: 410,
              height: 498,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.only(right: 220),
                    child: Text(
                      Constants.otpVerificationHeading,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                        fontFamily: AppFonts.font,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(right: 140),
                    child: Text(
                      Constants.otpFirstMessage,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff545454),
                        fontFamily: AppFonts.font,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(right: 196),
                    child: Text(
                      Constants.otpSecondMessage,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff545454),
                        fontFamily: AppFonts.font,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  // Use the OtpTextField widget here
                  Container(
                    margin: EdgeInsets.only(right: 70),
                    child: OtpTextField(controllers: _otpControllers)),
                  SizedBox(height: 35.0),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 25,),
    Text("Did'nt get the code?"),

    Container(
      margin: EdgeInsets.only(right: 5),
      child: ResendButton(horizontalMargin: screenWidth * 0.05)),
  ],
),
SizedBox(height: 15,),
                  // Continue Button
                  OtpPageButton(
                      //  onPressed: _submitOtp,
                      onPressed: () {

                        
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InitialMapPage(), // Redirect to OTP page
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
