// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/transaction_summary.dart';
import 'package:material_symbols_icons/symbols.dart';
// import 'material_symbols_icons/symbols.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "+233 57 159 2866",
                              style: TextStyle(
                                fontSize: 14,
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
                minVerticalPadding: 20,
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
                minVerticalPadding: 20,
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
                  minVerticalPadding: 25,
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
                  minVerticalPadding: 25,
                  contentPadding: EdgeInsets.symmetric(horizontal: 32),
                  leading: Icon(Icons.lock_outline),
                  title: Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
                  minVerticalPadding: 25,

                  contentPadding: EdgeInsets.symmetric(horizontal: 32),
                  // leading: Icon(Icons.shield_outlined),
                  // leading: Icon(MaterialSymbols.shield_moon_outlined),
                  leading: Icon(Symbols.shield_lock),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),

              // terms and conditions
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
                  minVerticalPadding: 25,
                  contentPadding: EdgeInsets.symmetric(horizontal: 32),
                  leading: Icon(Icons.library_books_outlined),
                  title: Text(
                    "Terms and Condition",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),

              // logout list tile
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
                  minVerticalPadding: 25,
                  contentPadding: EdgeInsets.symmetric(horizontal: 32),
                  leading: Icon(Icons.logout),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFA0101)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  iconColor: Color(0xFFFA0101),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
