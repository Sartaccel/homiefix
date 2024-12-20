// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:homiefix_application/presentation/themes/colors.dart';
// import 'package:homiefix_application/presentation/widgets/home_widget/home_screen_widget.dart'; // Import your widgets
// import 'package:http/http.dart' as http;

// class SearchResultsPage extends StatefulWidget {
//   final String searchQuery;

//   const SearchResultsPage({required this.searchQuery, Key? key}) : super(key: key);

//   @override
//   State<SearchResultsPage> createState() => _SearchResultsPageState();
// }

// class _SearchResultsPageState extends State<SearchResultsPage> {
//   List<dynamic> searchResults = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchSearchResults(widget.searchQuery);
//   }

//   Future<void> fetchSearchResults(String query) async {
//     final url =
//         'https://9949-223-185-24-239.ngrok-free.app/services/search?searchTerm=$query';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           searchResults = data;
//         });
//       } else {
//         setState(() {
//           searchResults = [];
//         });
//       }
//     } catch (e) {
//       setState(() {
//         searchResults = [];
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white, // Set background color to white
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Row with back button and search textfield
//               Row(
//                 children: [
//                   // Back button SVG
//                   SvgPicture.asset(
//                     'assets/icons/back_button.svg',
//                     width: 18, height: 18,
//                   ),
//                   const SizedBox(width: 15), // Add some spacing
                  
//                   // Search TextField
//                   Expanded(
//                     child: SearchTextField(
//                       hintText: 'Search',
//                       onChanged: (value) {
//                         fetchSearchResults(value);
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 10),

//               // Search Results
//               isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : Expanded(
//                       child: ListView.builder(
//                         itemCount: searchResults.length,
//                         itemBuilder: (context, index) {
//                           final item = searchResults[index];
//                           return ListTile(
//                             leading: SvgPicture.asset(
//                               "assets/icons/home_search_list.svg",
//                               width: 24,
//                               height: 24,
//                             ),
//                             title: Text(
//                               '${item['serviceName']} - ₹${item['price']}',
//                               style: const TextStyle(fontSize: 14),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
