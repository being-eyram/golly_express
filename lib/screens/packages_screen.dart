// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golly_express/components/package_card.dart';
import 'package:golly_express/constants.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Packages",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Current Shipment",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16.0),

                //
                Stack(
                  // alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFAFBFB),
                        // color: Colors.grey,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Name Goes Here",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            "#1234455",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFA3ADAA),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              foregroundColor: Color(0xFF398B79),
                              backgroundColor: Color(0xFFE3F2EF),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Received in Office"),
                                SizedBox(width: 10),
                                Container(
                                  alignment: Alignment.center,
                                  // height: 16,
                                  // width: 16,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //TODO: properly position the package icon in container and respect border radius
                    Positioned(
                      bottom: -60,
                      right: -60,
                      child: packageVector,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TrackingHistory()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrackingHistory extends StatelessWidget {
  const TrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tracking Package",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Eyram's MacBook Pro",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Joe's Petite",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here!",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
      ],
    );
  }
}
