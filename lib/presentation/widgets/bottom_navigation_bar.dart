import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/blocs/bottomnav/navigation.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:homiefix_application/presentation/screens/home_screen.dart';
import 'package:homiefix_application/presentation/screens/profile_screen.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

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

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) =>
                  context.read<NavigationCubit>().selectPage(index),
              children: const <Widget>[
                HomeScreen(),
                Center(child: Text('Search')),
                ProfileScreen()
              ],
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: AppColors.BottomNavbarIconSelected,
                  unselectedItemColor: AppColors.BottomNavbarIconUnselected,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  type: BottomNavigationBarType.fixed,
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  context.read<NavigationCubit>().selectPage(index);
                  _pageController.jumpToPage(index);
                },
                items: [
                  _buildBottomNavigationBarItem(
                    icon: AppIcons.home,
                    activeIcon: AppIcons.homeactive,
                    label: Constants.homeNavi,
                  ),
                  _buildBottomNavigationBarItem(
                    icon: AppIcons.cart,
                    activeIcon: AppIcons.activecart,
                    label: Constants.cartNavi,
                  ),
                  _buildBottomNavigationBarItem(
                    icon: AppIcons.profile,
                    activeIcon: AppIcons.activeprofile,
                    label: Constants.profileNavi,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}