import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        Constants.skipButtonText,
        style: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.font,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}

class SignInTextField extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const SignInTextField({
    Key? key,
   // required this.countryCodeController,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.89, // Responsive width
      height: 44, // Fixed height for input fields
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        border: Border.all(color: Color(0xffD9D9D9), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(width: 5),
          SizedBox(
            width: screenWidth * 0.1, // Responsive width for country code
            child: TextField(
            
              decoration: InputDecoration(
                hintText: Constants.mobileNumberFieldLabel,
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.font,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 13),
              ),
              enabled: false,
            ),
          ),
      //    SvgPicture.asset("assets/images/phone_textfield_arrow.svg"),
          const SizedBox(width: 10),
          VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: Constants.mobileNumberFieldLabel,
                hintStyle: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.font,
                ),
                counterText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.loginButtonLabel,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.35, // Dynamic padding
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: Color(0xff009980),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

class TermsAndPrivacyText extends StatelessWidget {
  final double horizontalMargin;

  const TermsAndPrivacyText({Key? key, required this.horizontalMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: Constants.agreeText,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: AppFonts.font,
              color: Color(0xff545454),
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: Constants.termsOfUse,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.font,
                  color: Color(0xff009980),
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Terms of Use clicked');
                  },
              ),
              TextSpan(
                text: Constants.agreeTextAnd,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.font,
                  color: Color(0xff545454),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: Constants.privacyPolicy,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.font,
                  color: Color(0xff009980),
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Privacy Policy clicked');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        Constants.backButtonText,
        style: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.font,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}


class OtpTextField extends StatelessWidget {
  final List<TextEditingController> controllers;

  OtpTextField({Key? key, required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          width: screenWidth * 0.14, // Responsive width
          child: TextFormField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffD9D9D9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffD9D9D9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffD9D9D9)),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ResendButton extends StatelessWidget {
  final double horizontalMargin;

  const ResendButton({Key? key, required this.horizontalMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: Constants.otpFourthMessage,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.font,
                  color: Color(0xff009980),
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Resend clicked');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class OtpPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OtpPageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.otpButtonLabel,
        style: TextStyle(fontFamily: AppFonts.font ,color: Colors.white, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.35, 
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: Color(0xff009980),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

// class MapSearchBox extends StatelessWidget {
//   final TextEditingController searchController;

//   const MapSearchBox({Key? key, required this.searchController}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       child: TextField(
//         controller: searchController,
//         decoration: InputDecoration(
//           hintText: 'Search',
//           hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
//           prefixIcon: Icon(Icons.search, color: Colors.black),
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

class MapSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const MapSearchTextField({
    Key? key,
    required this.searchController,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffD9D9D9),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}

class CurrentLocationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CurrentLocationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(7), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3), // Subtle shadow effect
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.my_location,
              color: Colors.black,
            ),
            SizedBox(width: 8), // Space between the icon and text
            Text(
              Constants.mapCurrentLocationLabel,
              style: TextStyle(
                fontFamily: AppFonts.font,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MapPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MapPageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.mapButtonLabel,
        style: TextStyle(fontFamily: AppFonts.font ,color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.35, // Dynamic padding
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: Color(0xff009980),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}



class SignInAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInAccountButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.signInAccountLabel,
        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: AppFonts.font),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.35, // Dynamic padding
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: Color(0xff009980),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
            )
      )
        );
  
  }
}





class SignInButton1 extends StatefulWidget {
  const SignInButton1({super.key});

  @override
  State<SignInButton1> createState() => _SignInButton1State();
}

class _SignInButton1State extends State<SignInButton1> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.9;

    return Center(
      child: MaterialButton(
        onPressed: () {
          // Add your onPressed action here
        },
        color: AppColors.ButtonColour,
        textColor: AppColors.ButtonTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
        ),
        minWidth: buttonWidth,
        height: 44,
        child: Text(
          Constants.SignInButtontext,
          style: GoogleFonts.figtree(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}



Class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorText; // Optional error text
  final TextInputType inputType; // Specify input type

  const CustomTextField({
    super.key, 
    required this.controller, 
    required this.labelText, 
    this.errorText, 
    required this.inputType, // Specify input type
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
  
    final double width = screenWidth * 0.87; 
   

    return Container(
      width: width,
      height: 44,
      child: TextField(
        controller: controller,
        keyboardType: inputType, 
        textAlign: TextAlign.center, 
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.borderfield), 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.borderfield),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.borderfield), 
          ),
          filled: true,
          fillColor: AppColors.bottombackground,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.03, 
            fontWeight: FontWeight.w400, 
            color:AppColors.textfieldtext, 
            fontFamily: 'inter'
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorText: errorText, 
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          color: AppColors.textfieldtype,
        ),
      ),
    );
  }
}


class updatebutton extends StatefulWidget {
  const updatebutton({super.key});

  @override
  State<updatebutton> createState() => _updatebuttonState();
}



class _updatebuttonState extends State<updatebutton> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonWidth = screenWidth * 0.9; 
    final buttonHeight = screenHeight * 0.05;

    return Center(
      child: MaterialButton(
        child: Text(
          Constants.update,
          style: GoogleFonts.figtree(
            fontSize: screenWidth * 0.04, 
            fontWeight: FontWeight.w600
          ),
        ),
        onPressed: () {

        },
        color: AppColors.ButtonColour,
        textColor: AppColors.ButtonTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.025), 
        ),
        minWidth: buttonWidth,
        height: buttonHeight,
      ),
    );
  }
}
        
