import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Track your package",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter tracking number and find your order",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            const TrackingNumberSearchField()
          ],
        ),
      ),
    );
  }
}
