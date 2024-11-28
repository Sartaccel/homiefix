import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/location.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profile_pic.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/username.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingValue = screenSize.width * 0.06;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.width * 0.1),
                      ProfilePic(
                        width: screenSize.width * 0.3,
                        height: screenSize.width * 0.3,
                      ),
                      SizedBox(height: screenSize.width * 0.02),
                      Name(name: ' Hi, Jijo'),
                      Location(location: 'Kanyakumari'),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.width * 0.1),
                Text(
                  Constants.fullname,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                    color: AppColors.fullname,
                  ),
                ),
                SizedBox(height: screenSize.width * 0.02),
                CustomTextField(
                  controller: _fullNameController,
                  labelText: 'Enter your Name',
                  
                  inputType: TextInputType.name, 
                ),
                SizedBox(height: screenSize.width * 0.02),
                Text(
                  Constants.emailaddress,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                    color: AppColors.fullname,
                  ),
                ),
                SizedBox(height: screenSize.width * 0.02),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Enter your email',
                  inputType: TextInputType.emailAddress,
                   
                ),
                SizedBox(height: screenSize.width * 0.02),
                Text(
                  Constants.phoneNumber,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                    color: AppColors.fullname,
                  ),
                ),
                SizedBox(height: screenSize.width * 0.02),
                SignInTextField(
                  phoneNumberController: _phoneNumberController,
                  
                ),
                SizedBox(height: screenSize.width * 0.1),
                updatebutton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

