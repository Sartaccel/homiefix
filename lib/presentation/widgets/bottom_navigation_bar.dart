import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    IconData outlinedIcon, 
    IconData filledIcon, 
    String label, 
    int index) {
    return BottomNavigationBarItem(
      icon: Icon(_selectedIndex == index ? filledIcon : outlinedIcon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const <Widget>[
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // Removes ripple effect
          highlightColor: Colors.transparent,   // Removes highlight effect
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavigationBarItem(Icons.home_outlined, Icons.home, Constants.homeNavi, 0),
            _buildBottomNavigationBarItem(Icons.shopping_cart_outlined, Icons.shopping_cart, Constants.cartNavi, 1),
            _buildBottomNavigationBarItem(Icons.person_outline_rounded, Icons.person, Constants.profileNavi, 2),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
