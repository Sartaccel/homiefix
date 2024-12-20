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
                children: [
                  // Custom Text Field
                  CustomTextFieldContainer(hintText: Constants.firstbox),

                  const SizedBox(width: 10),

                  // Custom Container
                  const CustomContainer(),
                ],
              ),
              const SizedBox(height: 10),
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
                  ResponsiveSignInField(phoneNumberController: phoneNumberController),
                  const SizedBox(width: 10),
                  CustomTextFieldContainer(hintText: "Pin code"),
                ],

              ),
              SizedBox(
                height: 10,
              ),
               Text(
                    Constants.homeaddress,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subhead,
                    ),
                  ),
                   SizedBox(
                height: 10,
              ),
               ResponsiveTextFieldContainer(hintText: Constants.homeaddress)
            ],
          ),
        ),
      ),
    );
  }
}
