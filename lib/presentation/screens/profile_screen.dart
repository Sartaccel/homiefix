import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/location.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profile_pic.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profileoption.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/referbox.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/username.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingValue = screenSize.width * 0.07;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),  
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePic(
                      width: screenSize.width * 0.2,  // Adjust width based on screen width
                      height: screenSize.width * 0.2,  // Adjust height based on screen width
                    ),
                    SizedBox(width: screenSize.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Name(name: Constants.profilename),
                        Location(location: Constants.location),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenSize.width * 0.025),
                Divider(
                  color: AppColors.devider,
                  thickness: 1,
                ), 
                SizedBox(height: screenSize.width * 0.025),

                // Profile Options
                ProfileOption(
                  image: AppIcons.documentfilled,  
                  title: Constants.myOrderTitle,
                  subtitle: Constants.myOrderinfo,  
                  onTap: () {
                    // Navigate to My Orders screen
                  },
                ),
                ProfileOption(
                  image: AppIcons.location,  
                  title: Constants.manageAddressTitle,
                  subtitle: Constants.manageAddressInfo,
                  onTap: () {
                    // Navigate to Manage Address screen
                  },
                ),
                ProfileOption(
                  image: AppIcons.coupon,  
                  title: Constants.couponsAvailableTittle,
                  subtitle: Constants.couponsAvailableInfo,
                  onTap: () {
                    // Navigate to Coupons Available screen
                  },
                ),
                ProfileOption(
                  image: AppIcons.settings,  
                  title: Constants.settingstitle,
                  subtitle: Constants.settingstitleinfo,
                  onTap: () {
                    // Navigate to Settings screen
                  },
                ),
                ProfileOption(
                  image: AppIcons.documentfilled,  
                  title: Constants.termsandConditionsTitle,
                  subtitle: Constants.termsandConditionsinfo,
                  onTap: () {
                    // Navigate to Terms and Conditions screen
                  },
                ),
                Referbox(),
                SizedBox(height: screenSize.width * 0.05),
                SignInbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
