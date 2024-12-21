import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
 

class AddnewScreen extends StatefulWidget {
  const AddnewScreen({super.key});

  @override
  State<AddnewScreen> createState() => _AddnewScreenState();
}

class _AddnewScreenState extends State<AddnewScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController nearbyController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  // Error message variables
  String phoneNumberError = '';
  String pinCodeError = '';
  String homeAddressError = '';
  String townError = '';
  String nearbyError = '';
  String districtError = '';
  String stateError = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double paddingSize = screenWidth * 0.04;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cuponsbackground,
        body: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row for Back Arrow and Add New Address Text
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
                      Constants.addnewaddress,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.couponshead,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 16),

              // Address Text
              Text(
                Constants.address,
                style: GoogleFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subhead,
                ),
              ),

              const SizedBox(height: 10),

              // Row for Custom Text Field and Container
              Row(
                children: const [
                  // Custom Text Field
                  CustomTextFieldContainer(hintText: Constants.firstbox),

                  SizedBox(width: 10),

                  // Custom Container
                  CustomContainer(),
                ],
              ),
              const SizedBox(height: 10),

              // Phone Number and Pin Code Fields
              Row(
                children: [
                  Text(
                    Constants.phoneNumber,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subhead,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    Constants.phoneNumber,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subhead,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ResponsiveSignInField(
                    phoneNumberController: phoneNumberController,
                  ),
                  const SizedBox(width: 10),
                  CustomTextFieldContainer(
                    hintText: "Pin Code",
                    controller: pinCodeController,
                  ),
                ],
              ),
              if (pinCodeError.isNotEmpty) 
                Text(
                  pinCodeError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: 10),

          
              Text(
                Constants.homeaddress,
                style: GoogleFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subhead,
                ),
              ),
              SizedBox(height: 15),
              ResponsiveTextFieldContainer(
                hintText: Constants.homeaddress,
                controller: homeAddressController,
              ),
              if (homeAddressError.isNotEmpty) 
                Text(
                  homeAddressError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: 20),

              // Town Field
              Text(
                Constants.town,
                style: GoogleFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subhead,
                ),
              ),
              SizedBox(height: 15),
              ResponsiveTextFieldContainer(
                hintText: Constants.town,
                controller: townController,
              ),
              if (townError.isNotEmpty) 
                Text(
                  townError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: 20),

              // Nearby Field
              Text(
                Constants.nearby,
                style: GoogleFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subhead,
                ),
              ),
              SizedBox(height: 15),
              ResponsiveTextFieldContainer(
                hintText: Constants.nearby,
                controller: nearbyController,
              ),
              if (nearbyError.isNotEmpty) 
                Text(
                  nearbyError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: 15),

              // District and State Fields
              Row(
                children: [
                  Text(
                    Constants.district,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subhead,
                    ),
                  ),
                  SizedBox(width: 150),
                  Text(
                    Constants.state,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subhead,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomTextFieldContainer(
                    hintText: Constants.district,
                    controller: districtController,
                  ),
                  SizedBox(width: 10),
                  CustomTextFieldContainer(
                    hintText: Constants.state,
                    controller: stateController,
                  ),
                ],
              ),
              if (districtError.isNotEmpty)
                Text(
                  districtError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              if (stateError.isNotEmpty)
                Text(
                  stateError,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: 160),

              // Add Address Button
              Updatebutton1(
                onPressed: () {
                  setState(() {
                  
                    phoneNumberError = '';
                    pinCodeError = '';
                    homeAddressError = '';
                    townError = '';
                    nearbyError = '';
                    districtError = '';
                    stateError = '';

                    // Validate fields
                    bool isValid = true;

                    if (phoneNumberController.text.isEmpty) {
                      phoneNumberError = "Please enter phone number.";
                      isValid = false;
                    }
                    if (pinCodeController.text.isEmpty) {
                      pinCodeError = "Please enter pin code.";
                      isValid = false;
                    }
                    if (homeAddressController.text.isEmpty) {
                      homeAddressError = "Please enter home address.";
                      isValid = false;
                    }
                    if (townController.text.isEmpty) {
                      townError = "Please enter town.";
                      isValid = false;
                    }
                    if (nearbyController.text.isEmpty) {
                      nearbyError = "Please enter nearby landmarks.";
                      isValid = false;
                    }
                    if (districtController.text.isEmpty) {
                      districtError = "Please enter district.";
                      isValid = false;
                    }
                    if (stateController.text.isEmpty) {
                      stateError = "Please enter state.";
                      isValid = false;
                    }

                    if (isValid) {
                      // Submit the form
                      // You can handle the submission here
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
