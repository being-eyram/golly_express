// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/cards/package_card.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/package.dart';

class PackageTrackingHistory extends StatelessWidget {
  const PackageTrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tracking History",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          // ...recentPackages.map((package) => PackageCard(package: package)),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentPackages.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => context.push("/currentShipment"),
                child: PackageCard(
                  package: recentPackages[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
          ),
        ],
      ),
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
        Text(
          "Tracking History",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 24.h),
        Center(
          child: Column(
            children: [
              trackingHistoryPackageIcon,
              Text(
                "There are no tracking history",
                style: TextStyle(
                  fontSize: 14.sp,
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
