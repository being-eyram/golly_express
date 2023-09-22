// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFE6EDB7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "My Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 37),
                Row(
                  children: [
                    userProfile,
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ben-Aaron Mills-Pappoe",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "+233 57 159 2866",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    FilledButton(
                      style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10)),
                      onPressed: () {},
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TransactionSummary(),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            leading: gollyExpressLogoMini,
            title: Text(
              "Your Golly Express Address",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            leading: Icon(Icons.location_on_outlined),
            title: Text(
              "My Address",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          // id verification list tile
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 2,
                  color: Color(0xFFF6F7F6),
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 32),
              leading: Icon(Icons.badge_outlined),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "ID Verification",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              subtitle: Text(
                "A valid Ghana card is required to verify your account",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF3AA60),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),

          // change password list tile
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xFFF6F7F6),
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 32),
              leading: Icon(Icons.lock_outline),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),

          // privacy policy list tile
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color(0xFFF6F7F6),
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 32),
              leading: Icon(Icons.shield_outlined),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionSummary extends StatelessWidget {
  const TransactionSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "To Receieve",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Total Orders",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Received",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
