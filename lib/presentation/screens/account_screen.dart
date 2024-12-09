import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/screens/otp_entering.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  void _submitOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    print('OTP entered: $otp');

    
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => OtpEntering()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 10),
            SvgPicture.asset(
              "assets/images/login_logo.svg",
              width: 287,
              height: 207,
            ),
            Container(
              margin: EdgeInsets.only(top: 65),
              width: 410,
              height: 498,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    Constants.otpVerificationHeading,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    Constants.otpFirstMessage,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff545454),
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    Constants.otpSecondMessage,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff545454),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 25.0),
                  
                  OtpTextField(controllers: _otpControllers),
                  SizedBox(height: 25.0),
                  
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
