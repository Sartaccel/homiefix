import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/screens/manage_address.dart';
import 'package:homiefix_application/presentation/screens/map_screen.dart';
import 'package:homiefix_application/presentation/screens/otp_entering.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/location.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profile_pic.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profileoption.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/referbox.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/username.dart';
import 'otp_success.dart'; // Import the OtpSuccess page

class ProfileLogoutScreen extends StatefulWidget {
  @override
  _ProfileLogoutScreenState createState() => _ProfileLogoutScreenState();
}

class _ProfileLogoutScreenState extends State<ProfileLogoutScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  void _submitOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    print('OTP entered: $otp');

    // Navigate to OtpSuccess page
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => OtpEntering(mobileNumber: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingValue = screenSize.width * 0.02 ;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              children: [
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenSize.width * 0.05),
                      child: ProfilePic(
                        width: screenSize.width * 0.2,
                        height: screenSize.width * 0.2,
                      ),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Name(name: Constants.profilename),
                        Location(location: Constants.location),
                      ],
                    ),
                    SizedBox(width: 165,),
                    InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  },
  child: SvgPicture.asset(
    "assets/icons/account edit icon.svg",
  ),
),

                  ],
                ),
                Divider(
                  color: AppColors.devider,
                  thickness: 1,
                ),
               // SizedBox(height: screenSize.width * 0.010),

                
                ProfileOption(
                  image: AppIcons.calender,
                  title: Constants.myOrderTitle,
                  subtitle: Constants.myOrderinfo,
                  onTap: () {
                    
                  },
                ),
                
                ProfileOption(
                  image: AppIcons.location,
                  title: Constants.manageAddressTitle,
                  subtitle: Constants.manageAddressInfo,   
                  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ManageAddress()),
    );
  },
                ),
                
                ProfileOption(
                  image: AppIcons.coupon,
                  title: Constants.couponsAvailableTittle,
                  subtitle: Constants.couponsAvailableInfo,
                  onTap: () {
                    
                  },
                ),
               
                ProfileOption(
                  image: AppIcons.contact,
                  title: Constants.contactUsTitle,
                  subtitle: Constants.contactUsinfo,
                  onTap: () {
                   
                  },
                ),
               
                ProfileOption(
                  image: AppIcons.settings,
                  title: Constants.settingstitle,
                  subtitle: Constants.settingstitleinfo,
                  onTap: () {
                   
                  },
                ),
                ProfileOption(
                  image: AppIcons.documentfilled,
                  title: Constants.termsandConditionsTitle,
                  subtitle: Constants.termsandConditionsinfo,
                  onTap: () {
                    
                  },
                ),
                SizedBox(height: screenSize.width * 0.01),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Referbox()),
                SizedBox(height: screenSize.width * 0.05),
                LogoutButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignIn(), // Redirect to OTP page
                          ),
                        );
                        print("Logout button pressed");
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}