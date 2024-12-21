import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_dialog.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          const  Text(Constants.skipButtonText,
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.font,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            Constants.skipButtonArrow,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

  class SignInTextField extends StatelessWidget {
  //  final TextEditingController countryCodeController;
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
              // controller: countryCodeController,
              // keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: Constants.mobileNumberCountryCodeLabel,
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
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: AppFonts.font),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.37, // Dynamic padding
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
              fontSize: 11,
              fontFamily: AppFonts.font,
              color: Color(0xff545454),
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: Constants.termsOfUse,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: AppFonts.font,
                  color: Color(0xff009980),
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
              
                  },
              ),
              TextSpan(
                text: Constants.agreeTextAnd,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: AppFonts.font,
                  color: Color(0xff545454),
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: Constants.privacyPolicy,
                style: const TextStyle(
                  fontSize: 11,
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
      child: Row(
        children: [
          const Text(
            Constants.backButtonArrow,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(Constants.backButtonText,
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.font,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          )
        ],
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
        style: TextStyle(fontFamily: AppFonts.font ,color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.37, // Dynamic padding
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
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.logoutButtonLabel,
        style: TextStyle(
          color: Color(0xff636363),
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: AppFonts.font,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.37, // Dynamic padding
          vertical: 12.0,
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide( // Add stroke color and width
            color: Color(0xff4d4d4d), // Stroke color
            width: 1.0,              // Stroke width
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final String hintText;
  final VoidCallback onVerifyPressed;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.hintText,
    required this.onVerifyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double width = screenWidth * 0.87; // Responsive width based on screen size

    return Container(
      width: width,
      height: 44, // Fixed height
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          hintText: hintText,
          hintStyle: GoogleFonts.figtree(
            color: AppColors.textfieldtext,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: TextButton(
            onPressed: onVerifyPressed,
            child: Text(
              Constants.verify,
              style: GoogleFonts.figtree(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.Verify, // Make sure this color is defined
              ),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}


class CustomTextField1 extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final String hintText;

  const CustomTextField1({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double width = screenWidth * 0.87; // Responsive width based on screen size

    return Container(
      width: width,
      height: 44, // Fixed height
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
       
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          hintText: hintText,
          hintStyle:GoogleFonts.figtree(
            color: AppColors.textfieldtext,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.borderfield),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}


class Updatebutton extends StatelessWidget {
  final VoidCallback onPressed;

  const Updatebutton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.87, // Responsive width based on screen size
      height: 44, // Fixed height
      child: ElevatedButton(
        onPressed: () => _showCustomDialog(context),
        child: const Text(
          Constants.otpButtonLabel,
          style: TextStyle(
            fontFamily: AppFonts.font,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          textStyle: const TextStyle(fontSize: 18.0),
          backgroundColor: Color(0xff009980),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: "Delete Changes?",
          descriptions: 'Your changes won’t be saved. Do you want to\ndelete them anyway?',
          deleteButtonText: 'Delete changes',
          cancelButtonText: 'Go back',
          onDeletePressed: () {
            Navigator.of(context).pop(); 
            onPressed();
          },
          onCancelPressed: () {
            Navigator.of(context).pop();
          }, onPressed: () {  },
        );
      },
    );
  }
}












class CustomTextFieldContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller; // Add the controller parameter

  const CustomTextFieldContainer({
    Key? key,
    required this.hintText,
    this.controller, // Make controller optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make the width responsive
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.44; // Adjust width based on screen size

    return Container(
      width: containerWidth, // Dynamically set width
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.bottombackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderfield),
      ),
      child: TextField(
        controller: controller, // Use the controller passed to this widget
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.figtree(
            color: AppColors.subheadfield,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}



class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to adjust the width dynamically
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.44; // Adjust width to 44% of screen width

    return Container(
      width: containerWidth,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.location1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.location2, // Assuming this is defined in your AppIcons constants
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Text(
            Constants.currentlocation, // Assuming this is defined in your Constants
            style: GoogleFonts.figtree(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.location1,
            ),
          ),
        ],
      ),
    );
  }
}


class ResponsiveSignInField extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const ResponsiveSignInField({
    Key? key,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to adjust the width dynamically
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth < 200 ? 159 : screenWidth * 0.44; // Responsive width for smaller screens

    return Container(
      width: containerWidth, // Dynamically set width
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        border: Border.all(color: AppColors.borderfield),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30, // Fixed width to keep '+91' visible
            child: TextField(
              decoration: InputDecoration(
                hintText: '+91',
                hintStyle: GoogleFonts.figtree(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              enabled: false,
            ),
          ),
          const SizedBox(width: 10),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: phoneNumberController, // Added controller here
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                hintStyle: GoogleFonts.figtree(
                  color: const Color(0xff999999),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                counterText: '', // Hide the counter text for maxLength
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ResponsiveTextFieldContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const ResponsiveTextFieldContainer({
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth, // Use full screen width
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.bottombackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderfield),
      ),
      child: TextField(
        controller: controller, // Added controller here
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.figtree(
            color: AppColors.subheadfield,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}




class SignInButton1 extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton1({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust the width of the button dynamically
    double buttonWidth = screenWidth * 0.9; // Set to 80% of the screen width

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0, // Only vertical padding
          ),
          textStyle: const TextStyle(fontSize: 18.0),
          backgroundColor: Color(0xff009980),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class Updatebutton1 extends StatelessWidget {
  final VoidCallback onPressed;

  const Updatebutton1({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.87, // Responsive width based on screen size
      height: 44, // Fixed height
      child: ElevatedButton(
        onPressed: () => _showCustomDialog(context),
        child: const Text(
          Constants.save,
          style: TextStyle(
            fontFamily: AppFonts.font,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          textStyle: const TextStyle(fontSize: 18.0),
          backgroundColor: Color(0xff009980),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: "Delete Changes?",
          descriptions: 'Your changes won’t be saved. Do you want to\ndelete them anyway?',
          deleteButtonText: 'Delete changes',
          cancelButtonText: 'Go back',
          onDeletePressed: () {
            Navigator.of(context).pop(); 
            onPressed();
          },
          onCancelPressed: () {
            Navigator.of(context).pop();
          }, onPressed: () {  },
        );
      },
    );
  }
}



class CustomContainer1 extends StatelessWidget {
  final VoidCallback onTap;

  const CustomContainer1({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
        height: 55, // Fixed height
        decoration: BoxDecoration(
          color:AppColors.cardbackround,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(

          child: Row(
      children: [
        SizedBox(width: 20,),
        Text(
          '+',
          style: GoogleFonts.figtree(
            fontSize: 30, // Adjust size as needed
            color: AppColors.address,
            fontWeight: FontWeight.w400
           
          ),
        ),
        SizedBox(width: 10),
        Text(
          Constants.Manageaddress,
          style: GoogleFonts.figtree(
            color: AppColors.address,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
      ]
        ),
      ),
      )
    );
  }
}


class NotificationContainer extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9, 
      height: 50, 
      decoration: BoxDecoration(
        color: AppColors.cardbackround,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            Text(
              Constants.notifications, // Notification text
              style: GoogleFonts.figtree(
                color: AppColors.notifications,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 1,),
            AdvancedToggleSwitch(),
          ],
        ),
      ),
    );
  }
}






class AdvancedToggleSwitch extends StatefulWidget {
  @override
  _AdvancedToggleSwitchState createState() => _AdvancedToggleSwitchState();
}

class _AdvancedToggleSwitchState extends State<AdvancedToggleSwitch> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 50.0,
      height: 25.0,
      value: status,
      borderRadius: 30.0,
      padding: 2,
      activeColor: Colors.white, // Color when the switch is on
      inactiveColor: Colors.white, // Color when the switch is off
      toggleColor: status ?AppColors.Verify : Colors.grey, // Toggle switch color
      switchBorder: Border.all(
        color: status ?AppColors.Verify : Colors.grey, // Border color for the switch
        width: 1.0, // Border width
      ),
      toggleBorder: Border.all(
        color: status ? Colors.green : Colors.grey, // Border color for the toggle
        width: 1.0, // Border width
      ),
      onToggle: (val) {
        setState(() {
          status = val;
        });
        print('Switch is $status');
      },
    );
  }
}

class FaqContainer extends StatelessWidget {
  const FaqContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.cardbackround,
        borderRadius: BorderRadius.circular(8), // Optional: to match other containers
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Constants.faq, 
            style: GoogleFonts.figtree(
              color: AppColors.notifications,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.arrow_forward_ios_outlined,size: 12),
          ),
        ],
      ),
    );
  }
}
