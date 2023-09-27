import 'package:flutter/material.dart';

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
          child: Text("Notifications",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              )),
        ),
      ),
    );
  }
}
