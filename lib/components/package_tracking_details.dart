import 'package:flutter/material.dart';

class PackageTrackingDetails extends StatelessWidget {
  const PackageTrackingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tracking Package",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFFEDEFEE),
              width: 1.5,
            ),
          ),
          // child: TrackingTimeline(),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TimelineNode.simple(),
              // TimelineNode.simple(),
              // TimelineNode.simple(),
              // TimelineTile(node: )
              // TimelineNode.simple(),
            ],
          ),
        ),
      ],
    );
  }
}
