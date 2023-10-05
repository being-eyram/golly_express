// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:golly_express/components/plusbutton_bottomsheet.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/notifications_screen.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/plus_screen.dart';
import 'package:golly_express/screens/profile_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int position = 0;

  void _onTap(int index) {
    // Jude dier GOAT !
    if (index == 2) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const PlusBottomSheet();
          });
      return;
    }

    setState(() {
      position = index;
    });
  }

  final _screens = [
    const HomeScreen(),
    const PackageScreen(),
    const PlusScreen(),
    // _customBottomSheet(context),
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
            icon: navHome,
            activeIcon: navHomeActive,
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: navPackages,
            activeIcon: navPackagesActive,
            label: "packages",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19557A46),
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.add_outlined),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19557A46),
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.add),
            ),
            label: "plus",
          ),
          BottomNavigationBarItem(
            icon: navProfile,
            activeIcon: navProfileActive,
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: navNotifications,
            activeIcon: navNotificationsActive,
            label: "notifications",
          ),
        ],
      ),
      // body: _screens.elementAt(position),
      body: IndexedStack(
        index: position,
        children: _screens,
      ),
    );
  }
}
