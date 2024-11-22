import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homiefix_application/presentation/blocs/bottomnav/navigation.dart';
import 'package:homiefix_application/presentation/constants/icons.dart';
import 'package:homiefix_application/presentation/constants/static.constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

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
              controller: PageController(initialPage: selectedIndex),
              onPageChanged: (index) =>
                  context.read<NavigationCubit>().selectPage(index),
              children: const <Widget>[
                Center(child: Text('Home')),
                Center(child: Text('Search')),
                Center(child: Text('Profile')),
              ],
            ),
            bottomNavigationBar: Theme(
              // Apply the custom theme to just the BottomNavigationBar in this widget
              data: Theme.of(context).copyWith(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: AppColors.BottomNavbarIconSelected,
                  unselectedItemColor: AppColors.BottomNavbarIconUnselected,
                  backgroundColor: AppColors.bottombackground,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) =>
                    context.read<NavigationCubit>().selectPage(index),
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
