import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/screens/otp_entering.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'otp_success.dart'; // Import the OtpSuccess page

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();  
}

class _HomeScreenState extends State<HomeScreen> {
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
