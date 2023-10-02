// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:golly_express/cards/verify_id_card.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/notifications_screen.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/profile_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final _userIsVerified = false;

  int position = 0;

  void _onTap(int index) {
    setState(() {
      position = index;
    });
  }

  final _screens = [
    _userIsVerified ? const HomeScreen() : const VerifyIDCard(),
    const PackageScreen(),
    const ProfileScreen(),
    const NotificationsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: _screens.elementAt(position),
    );
  }
}
