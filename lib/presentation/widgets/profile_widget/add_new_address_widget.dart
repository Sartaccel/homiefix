import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';

class SaveAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveAccountButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        Constants.saveaccountbutton,
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