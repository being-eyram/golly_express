import 'package:flutter/material.dart';
import 'package:golly_express/components/tracking_number_field.dart';

class TrackPackageCard extends StatelessWidget {
  const TrackPackageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 168,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE6EDB7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Track your package",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Enter tracking number and find your order",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            TrackingNumberSearchField()
          ],
        ),
      ),
    );
  }
}
