// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golly_express/cards/package_card.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/package.dart';

class PackageTrackingHistory extends StatelessWidget {
  const PackageTrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tracking History",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ...recentPackages.map((package) => PackageCard(package: package)),
        // ListView.builder(
        //     itemCount: recentPackages.length,
        //     itemBuilder: (context, index) {
        //       return Container();
        //     }),
      ],
    );
  }
}

class EmptyTrackingHistory extends StatelessWidget {
  const EmptyTrackingHistory({super.key});

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
              trackingHistoryPackageIcon,
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
