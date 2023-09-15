// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golly_express/cards/package_card.dart';
import 'package:golly_express/constants.dart';

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
          packageName: "Product Name Goes Here",
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
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
        const SizedBox(height: 16),
        PackageCard(
          packageName: "Product Name Goes Here",
          packageID: "#1234455",
          packageIcon: genericPackageIcon,
        ),
      ],
    );
  }
}
