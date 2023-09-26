import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/cards/icon_with_text_card.dart';
import 'package:golly_express/cards/track_package_card.dart';
import 'package:golly_express/components/custom_navigation_bar.dart';
import 'package:golly_express/constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // int _selectedIndex = 0;
  // void

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // int selectedIndex = 0;

    // void _navigateBottomBar(int index) {
    //   setState(() {
    //     selectedIndex = index;
    //   });
    // }

    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.home),
      //       icon: navHome,
      //       activeIcon: navHomeActive,
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.inventory_2_outlined),
      //       icon: navPackages,
      //       activeIcon: navPackagesActive,
      //       label: "packages",
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.person_outline),
      //       icon: navProfile,
      //       activeIcon: navProfileActive,
      //       label: "profile",
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.notifications_none),
      //       icon: navNotifications,
      //       activeIcon: navNotificationsActive,
      //       label: "notifications",
      //     ),
      //   ],
      // ),

      bottomNavigationBar: const CustomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning, kisa",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),

// your golly express container / dropbox goes here

                const SizedBox(height: 16),
                const TrackPackageCard(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: IconWithTextCard(
                        cardTitle: "Calculate Estimate",
                        cardColor: const Color(0xFFFFFBEE),
                        cardIcon: calculatorIcon,
                        iconContainerColor: const Color(0xFFFFC727),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: IconWithTextCard(
                        cardTitle: "Create Shipment",
                        cardColor: const Color(0xFFFFE6E2),
                        cardIcon: cargoShipIcon,
                        iconContainerColor: const Color(0xFFB35042),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const PackageTrackingHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageTrackingHistory extends StatelessWidget {
  const PackageTrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tracking History",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Column(
            children: [
              trackingHistoryPackage,
              const Text(
                "There are no tracking history",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
