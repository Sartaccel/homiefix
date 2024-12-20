import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/home_appliance_service.dart';
import 'package:homiefix_application/presentation/screens/search_results.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/themes/fonts.dart';
import 'package:homiefix_application/presentation/widgets/home_widget/home_screen_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> searchResults = [];
  bool isLoading = false;
  final FocusNode _searchFocusNode = FocusNode(); // Add FocusNode

  // Function to fetch search results

Future<void> fetchSearchResults(String query) async {
  if (query.isEmpty) {
    setState(() {
      searchResults = []; // Clear the results if the query is empty
    });
    return;
  }

  final url =
      'https://0c12-223-185-27-185.ngrok-free.app/services/search?searchTerm=$query';

  try {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        searchResults = data; // Update the search results
      });
    } else {
      setState(() {
        searchResults = [];
      });
    }
  } catch (e) {
    setState(() {
      searchResults = [];
    });
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingValue = screenSize.width * 0.02;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },

    child:  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              children: [
                Container(
                  width: 360,
                  height: 44,
                  padding: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/address_location.svg"),
                      const SizedBox(width: 10),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Santhapuram, Kanyakumari',
                              style: TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                                "assets/icons/address_down_arrow.svg")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
  children: [
    // Search Bar
    Container(
      width: 328,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD2D2D2)),
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset("assets/icons/home_search.svg"),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      fetchSearchResults(value);
                    } else {
                      setState(() {
                        searchResults = []; // Clear results when empty
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: AppFonts.font,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: AppFonts.font,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          if (isLoading)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
    const SizedBox(height: 10),
    // Display search results here
    if (searchResults.isNotEmpty)
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: searchResults.length > 5 ? 5 : searchResults.length, // Limit to 5 items
        itemBuilder: (context, index) {
          final item = searchResults[index];
          return Container(
            width: 360,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset("assets/icons/home_search_list.svg"),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item['serviceName']} - ₹${item['price']}',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
  ],
),



                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Service Categories',
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
                  height: 10,
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
              builder: (context) => HomeApplianceService(),
            ),
          );
        },
        child: HomeScreenServiceBox(
          firstText: 'Home',
          secondText: 'Appliance',
          svgAssetPath: 'assets/images/home_appliance.svg',
        ),
      ),
    ),
    Center(
      child: HomeScreenServiceBox(
        firstText: 'Carpentry',
        secondText: 'Wood Works',
        svgAssetPath: 'assets/images/carpentry.svg',
      ),
    ),
    Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Home',
                            secondText: 'Appliance',
                            svgAssetPath: 'assets/images/home_appliance.svg',
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
                            firstText: 'Carpentry',
                            secondText: 'Wood Works',
                            svgAssetPath: 'assets/images/carpentry.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Home',
                            secondText: 'Appliance',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Carpentry',
                            secondText: 'Wood Works',
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
                            firstText: 'Home',
                            secondText: 'Appliance',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Carpentry',
                            secondText: 'Wood Works',
                            svgAssetPath: 'assets/images/carpentry.svg',
                          ),
                        ),
                        Center(
                          child: HomeScreenServiceBox(
                            firstText: 'Home',
                            secondText: 'Appliance',
                            svgAssetPath: 'assets/images/home_appliance.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Popular services',
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
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the radius as needed
                              child: Image.asset(
                                "assets/images/cleaning2.png",
                                width: 165,
                                height: 225,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Full house \ncleaning",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the radius as needed
                              child: Image.asset(
                                "assets/images/cleaning1.png",
                                width: 165,
                                height: 225,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Fridge \nRepair",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the radius as needed
                              child: Image.asset(
                                "assets/images/cleaning2.png",
                                width: 165,
                                height: 225,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Full house \ncleaning",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the radius as needed
                              child: Image.asset(
                                "assets/images/cleaning1.png",
                                width: 165,
                                height: 225,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Fridge \nRepair",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
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
    ),
    );
  }
}






