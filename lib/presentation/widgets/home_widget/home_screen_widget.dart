import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';

class HomeScreenServiceBox extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String svgAssetPath;

  const HomeScreenServiceBox({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.svgAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110, // Adjust width as needed
      height: 130, // Adjust height to fit text and SVG
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7), // Background color of the box
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAssetPath,
            width: 50, // Adjust icon size
            height: 50,
          ),
          const SizedBox(height: 8), // Spacing between SVG and text
          Text(
            firstText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (secondText.isNotEmpty)
            Text(
              secondText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}




// class SearchTextField extends StatelessWidget {
//   final String hintText;
//   final Function(String) onChanged;

//   const SearchTextField({required this.hintText, required this.onChanged, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 328,
//       height: 44,
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       clipBehavior: Clip.antiAlias,
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(width: 1, color: Color(0xFFD2D2D2)),
//           borderRadius: BorderRadius.circular(11),
//         ),
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 10),
//           SvgPicture.asset("assets/icons/home_search.svg"), // Replace with the correct path to your search icon
//           const SizedBox(width: 10),
//           Expanded(
//             child: TextField(
//               onChanged: onChanged,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                   color: Color(0xFF333333),
//                   fontSize: 14,
//                   fontFamily: AppFonts.font,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 border: InputBorder.none,
//               ),
//               style: TextStyle(
//                 color: Color(0xFF333333),
//                 fontSize: 14,
//                 fontFamily: AppFonts.font,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
