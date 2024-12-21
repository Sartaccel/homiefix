import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cuponsbackground,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
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
                      Constants.settingstitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.couponshead,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ]
                
              ),
              SizedBox(height: 15,),
              NotificationContainer(onTap: (){}),
              SizedBox(height: 10,),
              FaqContainer()
            ]
          )
        )
      )
   );          
  }
}