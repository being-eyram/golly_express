import 'package:flutter/material.dart';
import 'package:golly_express/model/notification.dart';

import '../cards/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // primary: false,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: recentNotifications.isNotEmpty
            ? ListView.builder(
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
                    
                    Text("There are no notifications"),
                  ],
                ),
              ),
      ),
    );
  }
}
