import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/data/repositories/auth_repository.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'otp_success.dart'; // Import the OtpSuccess page


class OtpEntering extends StatefulWidget {
  final String mobileNumber; // Pass the mobile number to this screen

  OtpEntering({required this.mobileNumber});

  @override
  _OtpEnteringState createState() => _OtpEnteringState();
}

class _OtpEnteringState extends State<OtpEntering> {
  final AuthRepository _authRepository = AuthRepository();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  bool _isLoading = false;

  void _verifyOtp() async {
  final otp = _otpControllers.map((controller) => controller.text).join();

  if (otp.length != 4) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please enter a valid 4-digit OTP')),
    );
    return;
  }

  setState(() {
    _isLoading = true;
  });

  try {
    // Call verifyOtp method from AuthRepository
    final response = await _authRepository.verifyOtp(widget.mobileNumber, otp);

    setState(() {
      _isLoading = false;
    });

    if (response == "Mobile number verified successfully!") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InitialMapPage(), // Navigate to next page
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response)), // Display the response as the error
      );
    }
  } catch (e) {
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Something went wrong. Please try again.')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                  BackButton(
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
            SizedBox(height: 15),
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
                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.only(right: 70),
                    child: OtpTextField(controllers: _otpControllers),
                  ),
                  SizedBox(height: 35.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 25),
                      Text("Didn't get the code?"),
                      TextButton(
                        onPressed: () {
                          // Add resend functionality
                        },
                        child: Text("Resend"),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  OtpPageButton(
                    onPressed: _isLoading ? null : _verifyOtp,
                    isLoading: _isLoading,
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
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
