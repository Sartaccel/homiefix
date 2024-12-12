import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Reusable TextField widget
    Widget buildTextField(String label, String hintText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xffB2B2B2), fontSize: 14),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/icons/back_button.svg"),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Add New Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: AppFonts.font),
                  ),
                ],
              ),
              SizedBox(height: 24),
              buildTextField("Type of Address", "E.g., Home, Office"),
              SizedBox(height: 16),
              buildTextField("Phone Number", "Enter your phone number"),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: buildTextField("Pin Code", "Enter pin code")),
                  SizedBox(width: 16),
                  Expanded(child: buildTextField("District", "Enter district"))
                ],
              ),
              SizedBox(height: 16),
              buildTextField("House No / Building Name", "Enter house details"),
              SizedBox(height: 16),
              buildTextField("Locality / Town", "Enter locality"),
              SizedBox(height: 16),
              buildTextField("Nearby Landmark", "Enter landmark"),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: buildTextField("State", "Enter state")),
                  SizedBox(width: 16),
                  Expanded(child: buildTextField("Country", "Enter country")),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to success page
                    Navigator.pushNamed(context, '/otpSuccess');
                  },
                  child: Text("Save Address"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}