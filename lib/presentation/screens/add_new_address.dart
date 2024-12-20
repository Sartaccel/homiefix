import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/screens/manage_address.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/add_new_address_widget.dart';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


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
          
              SaveAccountButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ManageAddress(),
                          ),
                        );
                        print("Sign in button pressed");
                      })
            ],
          ),
        ),
      ),
    );
  }
}