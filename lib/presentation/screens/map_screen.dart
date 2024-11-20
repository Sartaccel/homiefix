import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InitialMapPage extends StatefulWidget {
  @override
  _InitialMapPageState createState() => _InitialMapPageState();
}

class _InitialMapPageState extends State<InitialMapPage> {
  final LatLng _initialPosition = LatLng(12.971598, 77.594566); // Example location (Bangalore, India)
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF8F6),
      body: Column(
        children: [
          // Google Map with a specific reduced height (not full screen)
          Container(
            height: 600, // Set the desired height for the map (you can adjust this value)
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                ),

                // Positioned TextField inside the map
                Positioned(
                  top: 50, // Adjust this value to change the vertical position of the TextField
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8), // Semi-transparent background
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Container below the map with a Text and a Button
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text widget
                Text(
                  'Welcome to the Map!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20), // Space between Text and Button

                // Button widget
                ElevatedButton(
                  onPressed: () {
                    // Action when the button is pressed
                    print('Button pressed!');
                  },
                  child: Text('Click Me'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
