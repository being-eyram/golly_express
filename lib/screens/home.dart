import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/cards/icon_with_text_card.dart';
import 'package:golly_express/cards/track_package_card.dart';
import 'package:golly_express/cards/verify_id_card.dart';
import 'package:golly_express/constants.dart';

import '../components/input_field.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "packages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "notifications",
          ),
        ],
      ),
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
                  "Good Morning, Kisa",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const VerifyIDCard(),
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
          "Tracking",
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
