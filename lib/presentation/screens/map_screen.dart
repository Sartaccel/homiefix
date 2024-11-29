import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homiefix_application/presentation/screens/account_screen.dart';
import 'package:homiefix_application/presentation/widgets/bottom_navigation_bar.dart';
import 'package:location/location.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/login_screen.dart';
import 'package:homiefix_application/presentation/widgets/custom_button.dart';

class InitialMapPage extends StatefulWidget {
  @override
  _InitialMapPageState createState() => _InitialMapPageState();
}

class _InitialMapPageState extends State<InitialMapPage> {
  final LatLng _initialPosition =
      LatLng(12.971598, 77.594566); // Example location (Bangalore, India)
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    _checkLocationPermissions();
  }

  // Check and request location permissions
  Future<void> _checkLocationPermissions() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return; // If service is not enabled, exit
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return; // If permissions are denied, exit
      }
    }
  }

  // Function to go to the user's current location
  Future<void> _goToCurrentLocation() async {
    try {
      final userLocation = await _location.getLocation();
      final currentLatLng =
          LatLng(userLocation.latitude!, userLocation.longitude!);

      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLatLng,
            zoom: 14.0,
          ),
        ),
      );
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF8F6),
      body: Column(
        children: [
          // Google Map with Current Location button
          Expanded(
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
                  myLocationButtonEnabled: false, // Disable default button
                  zoomControlsEnabled: true,
                ),

                // Positioned TextField inside the map
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffD9D9D9),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: MapSearchTextField(
                      searchController: _searchController,
                      hintText: Constants.mapTextfieldLabel,
                    ),
                  ),
                ),

                // Positioned Current Location Button inside the map
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: CurrentLocationButton(
                    onPressed: _goToCurrentLocation, // Pass the function
                  ),
                ),
              ],
            ),
          ),

          // Container below the map with Text and Button
          Container(
            padding: EdgeInsets.all(25),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text widget
                Text(
                  Constants.mapText1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  Constants.mapText2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15),

                // Navigation Button
                MapPageButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigation(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
