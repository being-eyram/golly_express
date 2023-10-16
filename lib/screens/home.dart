import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/cards/icon_with_text_card.dart';
import 'package:golly_express/cards/track_package_card.dart';
import 'package:golly_express/cards/verify_id_card.dart';
import 'package:golly_express/components/package_tracking_history.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/package.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userIsVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const MainContainer(),
      body: SafeArea(
        child: SingleChildScrollView(
          // reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning, Ben-Aaron",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),

                // display your golly express dropdown if verified else verify id card
                _userIsVerified
                    ? const SizedBox(height: 50)
                    : VerifyIDCard(
                        onTap: () => context.push("/verifyID"),
                      ),

                const SizedBox(height: 16),
                const TrackPackageCard(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconWithTextCard(
                      cardTitle: "Calculate Estimate",
                      cardColor: const Color(0xFFFFFBEE),
                      cardIcon: calculatorIcon,
                      iconContainerColor: const Color(0xFFFFC727),
                      onTap: () => context.push("/calculateEstimate"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconWithTextCard(
                      cardTitle: "Create Shipment",
                      cardColor: const Color(0xFFFFE6E2),
                      cardIcon: cargoShipIcon,
                      iconContainerColor: const Color(0xFFB35042),
                      onTap: () => context.push("/createShipment"),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                recentPackages.isEmpty
                    ? const EmptyTrackingHistory()
                    : const PackageTrackingHistory()
                // const EmptyTrackingHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
