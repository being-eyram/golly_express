import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golly_express/model/notification.dart';

import '../../cards/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // primary: false,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 30.0.h),
          child: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: recentNotifications.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: recentNotifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationCard(
                    notification: recentNotifications[index],
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You have no notifications"),
                  ],
                ),
              ),
      ),
    );
  }
}
