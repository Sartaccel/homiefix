import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/otp_entering.dart';
import 'package:homiefix_application/presentation/widgets/animation.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Create a controller for the text field
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // You can adjust these breakpoints to your liking for different screen sizes
    double imageWidth = screenWidth * 0.75;
    double imageHeight = screenHeight * 0.25;

    double containerWidth = screenWidth * 0.99;
    double containerHeight = screenHeight * 0.51;

    return Scaffold(
      backgroundColor: Color(0xffEDF8F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SkipButton(onPressed: () {
                        print("Skip button pressed");
                      })
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SvgPicture.asset(
                  "assets/images/login_logo.svg",
                  width: imageWidth,
                  height: imageHeight,
                ),
                SvgPicture.asset(
                  "assets/images/login_image.svg",
                  width: imageWidth,
                  height: imageHeight * 0.5,
                ),
              ],
            ),
            Container(
              width: containerWidth,
              height: containerHeight,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.loginButtonText + Constants.signupButtonText,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          fontFamily: 'Figtree',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  SignInTextField(
                    //  countryCodeController: _countryCodeController,
                    phoneNumberController: _phoneNumberController,
                  ),
                  SizedBox(height: 45),
                  TermsAndPrivacyText(horizontalMargin: screenWidth * 0.05),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpEntering(), // Redirect to OTP page
                          ),
                        );
                        print("Sign in button pressed");
                      })
                    ],
                  ),
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
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
