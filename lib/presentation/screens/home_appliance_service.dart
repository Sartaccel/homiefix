import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/home_appliances/ac_service.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/screens/profile_logout_screen.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';
import 'package:homiefix_application/presentation/widgets/home_widget/home_screen_widget.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/location.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profile_pic.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/profileoption.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/referbox.dart';
import 'package:homiefix_application/presentation/widgets/profile_widget/username.dart';

class HomeApplianceService extends StatefulWidget {
  const HomeApplianceService({super.key});

  @override
  State<HomeApplianceService> createState() => _HomeApplianceServiceState();
}

class _HomeApplianceServiceState extends State<HomeApplianceService> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingValue = screenSize.width * 0.02;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              children: [
             
         SizedBox(height: 20,),
             
               Row(
                 children: [
                  SizedBox(width: 20,),
                   SvgPicture.asset("assets/icons/back_button.svg"),
                   SizedBox(width: 105,),
                   Text(
'Home appliance',
style: TextStyle(
color: Color(0xFF191919),
fontSize: 15,
fontFamily: 'Figtree',
fontWeight: FontWeight.w500,
height: 0,
),
),
                 ],
               ),
               SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AcService(),
            ),
          );
        },
        child: HomeScreenServiceBox(
          firstText: 'AC',
          secondText: '',
          svgAssetPath: 'assets/images/home_appliance.svg',
        ),
      ),
    ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Fan',
                            secondText: '',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Fridge',
                            secondText: '',
                            svgAssetPath: 'assets/images/carpentry.svg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Geyser',
                            secondText: '',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Inverter &',
                            secondText: 'Stabilizers',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Microwave',
                            secondText: '',
                            svgAssetPath: 'assets/images/carpentry.svg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'TV',
                            secondText: '',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Washing',
                            secondText: 'machine',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Water',
                            secondText: 'purifier',
                            svgAssetPath: 'assets/images/carpentry.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
