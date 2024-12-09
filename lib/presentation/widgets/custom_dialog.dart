import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class CustomDialogBox extends StatelessWidget {
  final String title, descriptions, deleteButtonText, cancelButtonText;
  final VoidCallback onDeletePressed;
  final VoidCallback onCancelPressed;

  const CustomDialogBox({
    super.key,
    required this.title,
    required this.descriptions,
    required this.deleteButtonText,
    required this.cancelButtonText,
    required this.onDeletePressed,
    required this.onCancelPressed, required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: AppColors.backgroundColor, // Set dialog background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: screenWidth * 0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.backgroundColor, 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.figtree(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.username,
                    ),
                  ),
                  const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
