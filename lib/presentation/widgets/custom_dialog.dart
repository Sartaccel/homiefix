import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class CustomDialogBox extends StatelessWidget {
  final String title, descriptions, deleteButtonText, cancelButtonText;
  final VoidCallback onDeletePressed;
  final VoidCallback onCancelPressed;

  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.deleteButtonText,
    required this.cancelButtonText,
    required this.onDeletePressed,
    required this.onCancelPressed, required Null Function() onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dialogWidth = screenWidth * 0.87; // Responsive width matching text field

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: dialogWidth,  // Set the dialog box width
        padding: const EdgeInsets.all(16.0),  // Add padding here
        decoration: BoxDecoration(  // Add BoxDecoration to set the background color
          color: AppColors.backgroundColor,  
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,  // Adjust the height dynamically
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.figtree(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.username,
              ),
            ),
            SizedBox(height: 10),
            Text(
              descriptions,
              style: GoogleFonts.figtree(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.descriptions,
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancelPressed,
                  child: Text(
                    cancelButtonText,
                    style: GoogleFonts.figtree(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.goback,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onDeletePressed,
                  child: Text(
                    deleteButtonText,
                    style: GoogleFonts.figtree(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.delitechanges,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
