// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/notifications_screen.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/profile_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int position = 1;

  void _onTap(int index) {
    setState(() {
      position = index;
    });
  }

  final screens = [
    const HomeScreen(),
    const PackageScreen(),
    const ProfileScreen(),
    const NotificationsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: position,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          // icon: Icon(Icons.home),
          icon: navHome,
          activeIcon: navHomeActive,
          label: "Home",
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.inventory_2_outlined),
          icon: navPackages,
          activeIcon: navPackagesActive,
          label: "packages",
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.person_outline),
          icon: navProfile,
          activeIcon: navProfileActive,
          label: "profile",
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.notifications_none),
          icon: navNotifications,
          activeIcon: navNotificationsActive,
          label: "notifications",
        ),
      ],
    );
  }
}
